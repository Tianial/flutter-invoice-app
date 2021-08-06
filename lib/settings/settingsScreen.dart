import 'package:flutter/material.dart';
import 'package:flutter_demo_app/common/routes/Approutes.dart';



import 'models/settings_menu_model.dart';

class MySettingsScreen extends StatelessWidget {

  final List<SettingsMenuItem> menuItems = [
    SettingsMenuItem(
      title: 'Taxes',
      color: Colors.blueGrey,
      icon: Icons.settings,
      route: AppRoutes.TaxesPage,

    ),
    SettingsMenuItem(
        title: 'Password',
        color: Colors.orangeAccent,
        route: AppRoutes.PasswordPage,
        icon: Icons.settings
    ),
    SettingsMenuItem(
        title: 'Users',
        color: Colors.blue,
        route: AppRoutes.UserPage,
        icon: Icons.group
    ),
    SettingsMenuItem(
        title: 'Items',
        color: Colors.redAccent,
        route: AppRoutes.ItemPage,
        icon: Icons.work
    ),
  ];

  void goToScreen(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  //render each [SettingsMenuItem] Item
  Container renderSettingsMenuItem(SettingsMenuItem menu,
      BuildContext context) {
    return Container(
      child: ListTile(
          onTap: () => goToScreen(context, menu.route),
          leading: Icon(menu.icon, color: Colors.white),
          title: Text(menu.title, style: TextStyle(color: Colors.white)), //Text
          // subtitle: Text(menu.description),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white)),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [menu.color.withOpacity(0.8), menu.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(20)

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // all widgets always contains build method
    return Center(
      child: ListView(
          shrinkWrap: true,
          children: this.menuItems.map((menu) => this.renderSettingsMenuItem(menu, context)).toList()
      ),
    );


  }


}



