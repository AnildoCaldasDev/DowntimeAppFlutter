import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;
  String router;

  NavigationModel({this.title, this.icon, this.router});
}

List<NavigationModel> navigationItems = [
  // NavigationModel(title: "Home", icon: Icons.home, router:  NavigationRouterType.home),
  // NavigationModel(title: "Access Control", icon: Icons.account_box, router:  NavigationRouterType.accesscontrol),
  //  NavigationModel(title: "Covid19 - Quiz", icon: Icons.format_list_numbered, router:  NavigationRouterType.covid19),
  // NavigationModel(title: "Dashboards", icon: Icons.insert_chart, router:  NavigationRouterType.dashboards),
  // NavigationModel(title: "Downtimes", icon: Icons.av_timer, router:  NavigationRouterType.downtimes),
  // NavigationModel(title: "Foxzilla", icon: Icons.perm_data_setting, router:  NavigationRouterType.foxzilla),
  // NavigationModel(title: "Inventory", icon: Icons.domain, router:  NavigationRouterType.inventory),
  // NavigationModel(title: "Master Data", icon: Icons.data_usage, router:  NavigationRouterType.masterdata),
  // NavigationModel(title: "Spare Parts", icon: Icons.settings_input_component, router:  NavigationRouterType.spareparts),
  // NavigationModel(title: "MMS", icon: Icons.dvr, router:  NavigationRouterType.mms),
  // NavigationModel(title: "TI-Corporativa", icon: Icons.person_pin, router:  NavigationRouterType.ticorporativa),
  // NavigationModel(title: "Settings", icon: Icons.settings, router:  NavigationRouterType.settings),
  NavigationModel(title: "Home", icon: Icons.home, router: "home"),
  NavigationModel(
      title: "Aula Flutter", icon: Icons.account_box, router: "accesscontrol"),
  NavigationModel(
      title: "Dashboards", icon: Icons.insert_chart, router: "dashboards"),
  NavigationModel(
      title: "Downtimes", icon: Icons.av_timer, router: "downtimes"),
  // NavigationModel(
  //     title: "Foxzilla", icon: Icons.perm_data_setting, router: "foxzilla"),
  NavigationModel(title: "Inventory", icon: Icons.domain, router: "inventory"),
  NavigationModel(
      title: "Lista de Tarefas", icon: Icons.list, router: "todolist"),
  NavigationModel(
      title: "Mask Delivery", icon: Icons.face, router: "maskdelivery"),
  NavigationModel(title: "MMS", icon: Icons.dvr, router: "mms"),
  NavigationModel(
      title: "Repository Pattern",
      icon: Icons.pages,
      router: "repositorypattern"),
  NavigationModel(
      title: "Anatomy of Flutter", icon: Icons.pages, router: "anatomyflutter"),
  NavigationModel(title: "Settings", icon: Icons.settings, router: "settings"),
];

// enum NavigationRouterType {
//   home,
//   accesscontrol,
//   covid19,
//   dashboards,
//   downtimes,
//   foxzilla,
//   inventory,
//   masterdata,
//   spareparts,
//   mms,
//   ticorporativa,
//   settings
// }

// extension on NavigationRouterType {
//   String toShortString() {
//     return this.toString().split('.').last;
//   }

// NavigationRouterType getEnumRouterByValue(String router){
//    return   NavigationRouterType()
// }
