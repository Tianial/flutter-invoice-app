import 'package:flutter/material.dart';
import 'package:flutter_demo_app/common/routes/Approutes.dart';
import 'package:flutter_demo_app/settings/taxes/provider/TaxProvider.dart';
import 'package:flutter_demo_app/settings/taxes/taxes_page.dart';
import 'package:provider/provider.dart';

import 'home/firminformations/firm_informations.dart';
import 'home/home_screen.dart';
import 'home/ingoinginvoices/ingoing_invoices.dart';
import 'home/kunden_page.dart';
import 'home/outgoiginvoices/outgoing_invoices.dart';
import 'report/reportScreen.dart';
import 'settings/items/item.dart';
import 'settings/password/password.dart';
import 'settings/settingsScreen.dart';
import 'common/routes/tabsbottomScreen.dart';
import 'settings/taxes/new_taxes_page.dart';
import 'settings/users/users_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TaxProvider(),
    child: MyApp(),
  )); // permits the app to be runned//
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsButtonScreen(),
      //initialRoute: '/'
      routes: {
        //routes is here ist the attribute and waits for the map(key:value)
        AppRoutes.TabButtonScreen: (context) => TabsButtonScreen(),
        AppRoutes.MyHomeScreen: (context) => MyHomeScreen(),
        AppRoutes.ReportScreen: (context) => ReportScreen(),
        AppRoutes.MySettingsScreen: (context) => MySettingsScreen(),
        AppRoutes.MyKundenPage: (context) => MyKundenPage(),
        AppRoutes.FirmInformationsPage: (context) => FirmInformationsPage(),
        AppRoutes.IngoingInvoicePage: (context) => IngoingInvoicePage(),
        AppRoutes.OutgoingInvoicePage: (context) => OutgoingInvoicePage(),
        // Settings routes
        AppRoutes.UserPage: (context) => UserPage(),
        AppRoutes.ItemPage: (context) => ItemPage(),
        AppRoutes.TaxesPage: (context) => TaxesPages(),
        AppRoutes.PasswordPage: (context) => PasswordPage(),
        AppRoutes.NewTaxesPage: (context) => NewTaxesPage(),
      },
    );
  }
}
