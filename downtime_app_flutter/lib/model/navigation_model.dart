import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Home", icon: Icons.home),
  NavigationModel(title: "Access Control", icon: Icons.account_box),
   NavigationModel(title: "Covid19 - Quiz", icon: Icons.format_list_numbered),  
  NavigationModel(title: "Dashboards", icon: Icons.insert_chart),
  NavigationModel(title: "Downtimes", icon: Icons.av_timer),
  NavigationModel(title: "Foxzilla", icon: Icons.perm_data_setting),
  NavigationModel(title: "Inventory", icon: Icons.domain),  
  NavigationModel(title: "Master Data", icon: Icons.data_usage),
  NavigationModel(title: "Spare Parts", icon: Icons.settings_input_component),  
  NavigationModel(title: "MMS", icon: Icons.dvr),
  NavigationModel(title: "Human Resources", icon: Icons.person_pin),    
  NavigationModel(title: "Settings", icon: Icons.settings),
];
