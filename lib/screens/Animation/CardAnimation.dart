import 'package:flutter/material.dart';

class CardAnimation extends StatefulWidget {
  final Color backgroundColor;
  final bool isVertical;
  final List? cardList;
  final double? height;
  CardAnimation(
      {Key? key,
      this.backgroundColor = Colors.transparent,
      this.isVertical = false,
      @required this.cardList,
      @required this.height})
      : super(key: key);

  @override
  _CardAnimationState createState() => _CardAnimationState();
}

class _CardAnimationState extends State<CardAnimation>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getListUI();
  }

  Widget getListUI() {
    return widget.isVertical ? verticalCard() : horizontalCard();
  }

  Widget horizontalCard() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            height: widget.height,
          );
        } else {
          return Container(
            height: widget.height,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
              itemCount: widget.cardList!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final int count =
                    widget.cardList!.length > 10 ? 10 : widget.cardList!.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animationController!,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                animationController!.forward();

                return AnimatedBuilder(
                    animation: animationController!,
                    builder: (BuildContext context, Widget? child) {
                      return FadeTransition(
                          opacity: animation,
                          child: Transform(
                              transform: Matrix4.translationValues(
                                  50 * (1.0 - animation.value), 0.0, 0.0),
                              child: widget.cardList![index]));
                    });
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10.0,
                );
              },
            ),
          );
        }
      },
    );
  }

  Widget verticalCard() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return Container(
            height: widget.height,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              // controller: _scrollController,
              padding: EdgeInsets.symmetric(vertical: 15.0),
              itemCount: widget.cardList!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final int count =
                    widget.cardList!.length > 10 ? 10 : widget.cardList!.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animationController!,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                animationController!.forward();

                return AnimatedBuilder(
                    animation: animationController!,
                    builder: (BuildContext context, Widget? child) {
                      return FadeTransition(
                          opacity: animation,
                          child: Transform(
                              transform: Matrix4.translationValues(
                                  0.0, 50 * (1.0 - animation.value), 0.0),
                              child: widget.cardList![index]));
                    });
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10.0,
                );
              },
            ),
          );
        }
      },
    );
  }
}
