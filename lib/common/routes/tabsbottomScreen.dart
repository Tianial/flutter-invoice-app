import 'package:flutter/material.dart';
import 'package:flutter_demo_app/home/home_screen.dart';
import 'package:flutter_demo_app/report/reportScreen.dart';
import 'package:flutter_demo_app/settings/settingsScreen.dart';

//Changes in same component=Statefulwidget//
class TabsButtonScreen extends StatefulWidget {
  @override
  _TabsButtonScreenState createState() => _TabsButtonScreenState();
}

class _TabsButtonScreenState extends State<TabsButtonScreen> {

  int selectedScreenIdex;
  Map<String, Object> selectedScreenObject;

  final List<Map<String, Object>>  screens  = [ //strings itself extends object reason why 'Home' acts as an object here.
    {
      'title': 'Home',
      'page': MyHomeScreen()
    },
   {
      'title': 'Report' ,
       'page': ReportScreen()
   },
   {
      'title': 'Settings' ,
       'page': MySettingsScreen()
    }
  ];

  @override
  void initState() { //initState here is to initialise attributes
    selectedScreenIdex = 0;
    selectedScreenObject = screens[0]; //each time a number changes  in screen,it goes n chooses in screen line 17 its coresponding line
    super.initState();//super is use to call the constructor of the mum
  }

  void onPressTab(int index){
    //setState here helps in changing the state each time a tab is pressed(actualises the flutter page)
    setState(() {
      selectedScreenIdex = index;
      selectedScreenObject = screens[index]; //when e.g 1 is called as index then it goes to screen and execute what is at position 1

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedScreenObject['title']),
        ),
        body: selectedScreenObject['page'],

        bottomNavigationBar: BottomNavigationBar(
          onTap: onPressTab,
          currentIndex: selectedScreenIdex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), //icon wait icondata as type and home is of type icondata
                label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.report),
                label: 'Report'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),
                label: 'Settings')

          ],
        )
    );
  }
}
