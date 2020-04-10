import 'package:downtime_app_flutter/model/navigation_model.dart';
import 'package:downtime_app_flutter/theme.dart';
import 'package:flutter/material.dart';

import 'collapsing_list_tile.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 60;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
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
    return Container(
      width: widthAnimation.value,
      color: drawerBackgroundColor,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.0),
          CollapsingListTile(
            title: 'Anildo Caldas',
            icon: Icons.person,
            animationController: _animationController,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, counter) {
                return CollapsingListTile(
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController);
              },
              itemCount: navigationItems.length,
            ),
          ),
          SizedBox(height: 10.0),
          InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: Colors.white,
                  size: 40.0)),          
        ],
      ),
    );
  }
}
