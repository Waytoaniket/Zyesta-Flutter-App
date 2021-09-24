import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/NewEvent/postEvent.dart';
import 'package:zyesta_app/screens/SearchByVenueAndIntrest/widget/appbar.dart';
import 'package:zyesta_app/screens/SearchByVenueAndIntrest/widget/card.dart';
import 'package:zyesta_app/screens/SearchByVenueAndIntrest/widget/searchCategory.dart';
import 'package:zyesta_app/screens/SearchByVenueAndIntrest/widget/suffixiconbutton.dart';
import 'package:zyesta_app/screens/SearchByVenueAndIntrest/widget/searchbar.dart';
import 'package:zyesta_app/utils/const.dart';

class SearchByVenueAndIntrest extends StatefulWidget {
  static const String id = 'SearchByVenueAndIntrest';

  final String? title;

  const SearchByVenueAndIntrest({Key? key, this.title}) : super(key: key);

  @override
  _SearchByVenueAndIntrestState createState() =>
      _SearchByVenueAndIntrestState();
}

class _SearchByVenueAndIntrestState extends State<SearchByVenueAndIntrest>
    with TickerProviderStateMixin {
  List eventList = [];
  TextEditingController search = TextEditingController();
  AnimationController? animationController;
  SearchCategoryType searchCategoryType = SearchCategoryType.newest;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(body: getEventList(size, height, width));
  }

  getEventList(Size size, double height, double width) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            searchAppBar(context, widget.title!),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 18.0, bottom: 20, right: 18.0),
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.0, vertical: 20),
                            child: searchBar(
                                size,
                                context,
                                "Search by ${widget.title}",
                                Icons.search,
                                search,
                                TextInputType.text,
                                searchCategoryType,
                                updateSearchCategory),
                          )
                        ],
                      ),
                    ),
                    buildFutureBuilder(size, height, width),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'Not finding the Interests of your Choice?',
                                style: TextStyle(
                                    color: AppTheme.primaryColor, fontSize: 15),
                              ),
                            ),
                          ),
                          Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: AppTheme.primaryColor,
                                textStyle: TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontSize: width / 25,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, PostNewEvent.id);
                              },
                              child: Text('Post one!'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.0,
                              bottom: 20.0,
                              right: 20.0,
                            ),
                            child: suffixIconButton(
                                context,
                                'Host Your Own Event',
                                20,
                                height / 15,
                                width / 1.3,
                                Icons.add_circle,
                                height / 25),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder buildFutureBuilder(Size size, double height, double width) {
    return FutureBuilder(
      future: Constants.eventList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  height: size.height / 3.8,
                  child: Image.asset('assets/images/homepage/imageLoader.gif'),
                )
              ],
            ),
          );
        } else if (snapshot.hasData) {
          eventList.clear();
          eventList.addAll(snapshot.data);
          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: width / (height / 3.2),
            ),
            delegate:
                SliverChildListDelegate(eventList.asMap().entries.map((entry) {
              final int count = eventList.length > 10 ? 10 : eventList.length;
              final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animationController!,
                      curve: Interval((1 / count) * entry.key, 1.0,
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
                        child: CardList(
                          object: entry.value,
                        ),
                      ),
                    );
                  });
            }).toList()),
          );
        } else {
          return SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  height: size.height / 3.8,
                  child: Center(
                    child: Text('No Posts Available Refresh'),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }

  void updateSearchCategory(SearchCategoryType searchCategoryData) {
    setState(() {
      searchCategoryType = searchCategoryData;
    });
  }
}
