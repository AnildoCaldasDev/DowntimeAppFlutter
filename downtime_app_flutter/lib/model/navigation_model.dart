import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Access Control", icon: Icons.account_box),
  NavigationModel(title: "Dashboards", icon: Icons.insert_chart),
  NavigationModel(title: "Downtimes", icon: Icons.av_timer),
  NavigationModel(title: "Master Data", icon: Icons.data_usage),
  NavigationModel(title: "Spare Parts", icon: Icons.settings_input_component),
  NavigationModel(title: "Inventory", icon: Icons.domain),  
  NavigationModel(title: "MMS", icon: Icons.dvr),
  NavigationModel(title: "Foxzilla", icon: Icons.perm_data_setting),
  NavigationModel(title: "Settings", icon: Icons.settings),
];
