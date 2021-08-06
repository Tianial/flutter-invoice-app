import 'package:flutter/material.dart';
import 'package:flutter_demo_app/common/routes/Approutes.dart';
import 'package:flutter_demo_app/home/models/home_menu_model.dart';

class MyHomeScreen extends StatelessWidget {
  final List<HomeMenuItem> menuItems = [
    HomeMenuItem(
        title: 'Ausgangrechnungen',
        color: Colors.green ,
        description:' ' ,
        icon:Icons.settings,
      route:AppRoutes.OutgoingInvoicePage,

    ),
    HomeMenuItem(
        title: 'Eingangrechnungen',
        color: Colors.amber,
        description: '',
        route: AppRoutes.IngoingInvoicePage,
        icon: Icons.settings
    ),
    HomeMenuItem(
        title: 'Kunden',
        color: Colors.pinkAccent,
        description: '',
        route: AppRoutes.MyKundenPage,
        icon: Icons.group
    ),
    HomeMenuItem(
        title: 'Geschaeftinformationen',
        color: Colors.lightBlueAccent,
        description: '',
        route: AppRoutes.FirmInformationsPage,
        icon: Icons.work
    ),
  ];

  void goToScreen(BuildContext context,String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }
  //render each [HomeMenuItem] Item
  Container renderHomeMenuItem(HomeMenuItem menu, BuildContext context) {
    return Container(
      child: ListTile(
        onTap:() =>goToScreen(context, menu.route),
        leading: Icon(menu.icon,color: Colors.white),
        title: Text(menu.title ,style:TextStyle(color: Colors.white) ), //Text
        subtitle: Text(menu.description),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white)),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [menu.color.withOpacity(0.8),menu.color],
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
        children: this.menuItems.map((menu) => this.renderHomeMenuItem(menu, context)).toList()
      ),
    );


  }
}
