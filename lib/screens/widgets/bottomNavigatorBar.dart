import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/Chat/chat_main_page.dart';
import 'package:zyesta_app/screens/HomePage/homescreen.dart';

Widget bottomNavigatorBar(int? index) {
  var selected = index;
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
      ),
      boxShadow: [
        BoxShadow(
            offset: Offset(0.0, 1.00), //(x,y)
            blurRadius: 4.00,
            color: Colors.grey,
            spreadRadius: 1.00),
      ],
    ),
    height: 70,
    child: ClipRRect(
      // clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
      ),
      child: StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  child: BottomNavigationBar(
                    backgroundColor: AppTheme.nearlyWhite,
                    selectedItemColor: AppTheme.primaryColor1,
                    unselectedItemColor: AppTheme.primaryColor1,
                    iconSize: 24,
                    unselectedFontSize: 14,
                    selectedFontSize: 14,
                    onTap: (value) {
                      if (index != value || index == null) {
                        if (value == 0) {
                          print('home');
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomeScreen.id, (route) => false);
                        }
                        if (value == 1) {
                          Navigator.pushNamed(context, ChatMainScreen.id);
                        }
                      }
                    },
                    items: [
                      new BottomNavigationBarItem(
                        icon: ShaderMask(
                          shaderCallback: (Rect bound) {
                            return AppTheme.buttonGradient.createShader(bound);
                          },
                          child: Icon(
                            Icons.home,
                            size: 30,
                          ),
                        ),
                        label: 'Home',
                      ),
                      new BottomNavigationBarItem(
                        icon: ShaderMask(
                          shaderCallback: (Rect bound) {
                            return AppTheme.buttonGradient.createShader(bound);
                          },
                          child: Icon(
                            Icons.chat,
                            size: 30,
                          ),
                        ),
                        label: 'Chat',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: AppTheme.nearlyWhite,
                height: 8,
                child: selected != null
                    ? Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: selected == 0
                                    ? AppTheme.primaryColor1
                                    : AppTheme.nearlyWhite,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: selected == 1
                                    ? AppTheme.primaryColor1
                                    : AppTheme.nearlyWhite,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(
                        color: AppTheme.nearlyWhite,
                      ),
              )
            ],
          );
        },
      ),
    ),
  );
}
