import 'package:downtime_app_flutter/commons/navigation_drawer_bloc.dart';
import 'package:downtime_app_flutter/model/navigation_model.dart';
import 'package:downtime_app_flutter/theme.dart';
import 'package:flutter/material.dart';

import 'collapsing_list_tile.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  final NavigationDrawerBloc bloc;
  CollapsingNavigationDrawer({@required this.bloc});

  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 50;
  bool isCollapsed = true;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) => getWidget(context, widget));
  }

  Widget getWidget(context, widget) {
    return Material(
        elevation: 80.0,
        child: Container(
          width: widthAnimation.value,
          // color: drawerBackgroundColor,
          color: backGroundColorFuturistic,
          child: Column(
            children: <Widget>[
              SizedBox(height: 35.0),
              CollapsingListTile(
                title: 'Anildo Caldas',
                icon: Icons.person,
                animationController: _animationController,
              ),
              Divider(color: Colors.grey, height: 10.0),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return Divider(height: 12.0);
                  },
                  itemBuilder: (context, counter) {
                    return CollapsingListTile(
                        onTap: () {
                          setState(() {
                            currentSelectedIndex = counter;
                            Navigator.of(context).pop();
                            bloc.updateNavigation(
                                navigationItems[counter].router);
                          });
                          // Navigator.of(context).pop();
                          // bloc.updateNavigation(navigationItems[counter].router);
                        },
                        title: navigationItems[counter].title,
                        icon: navigationItems[counter].icon,
                        animationController: _animationController,
                        isSelected: currentSelectedIndex == counter);
                  },
                  itemCount: navigationItems.length,
                ),
              ),
              //SizedBox(height: 10.0),
              // InkWell(
              //     onTap: () {
              //       setState(() {
              //         isCollapsed = !isCollapsed;
              //         isCollapsed
              //             ? _animationController.forward()
              //             : _animationController.reverse();
              //       });
              //     },
              //     child: AnimatedIcon(
              //         icon: AnimatedIcons.close_menu,
              //         progress: _animationController,
              //         color: Colors.white,
              //         size: 30.0)),
              // SizedBox(height: 5.0),
            ],
          ),
        ));
  }
}
