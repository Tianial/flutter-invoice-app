

import 'package:flutter/material.dart';

class HomeMenuItem {
  final IconData icon;
  final String title;
  final String route;
  final Color color;
  final String description;
  

  HomeMenuItem({@required this.icon,@required this.title, @required this.route, @required this.color, @required this.description});  //@required means the parameters of the constructor is obligatory
  
}
