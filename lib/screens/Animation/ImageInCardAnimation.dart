import 'package:flutter/cupertino.dart';
import 'package:vector_math/vector_math_64.dart';

class ImageInCardAnimation extends StatefulWidget {
  final String? image;
  final double? borderRadius;
  const ImageInCardAnimation({Key? key, this.image, this.borderRadius})
      : super(key: key);

  @override
  _ImageInCardAnimationState createState() => _ImageInCardAnimationState();
}

class _ImageInCardAnimationState extends State<ImageInCardAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? heartbeatAnimation;

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    heartbeatAnimation =
        Tween<double>(begin: 1.5, end: 1.2).animate(controller!);
    controller!.forward();
    controller!.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: heartbeatAnimation!,
        builder: (context, widget) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(this.widget.borderRadius!),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.diagonal3(Vector3(heartbeatAnimation!.value,
                    heartbeatAnimation!.value, heartbeatAnimation!.value)),
                child: Image.asset(
                  this.widget.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        });
  }
}
