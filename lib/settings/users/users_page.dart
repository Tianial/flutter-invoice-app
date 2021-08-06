import 'package:flutter/material.dart';
import 'package:flutter_demo_app/models/user.dart';
class UserPage extends StatelessWidget {

  final List<User> userList = [
    User('RO', 'Rosine', 'Hello,Thanks so much 👍', '12:25', Colors.red),
    User('MO', 'Monthe', 'Hi,i didnt see any Tax limitation 👀', '12:08', Colors.blue),
    User('LO', 'Loic', 'My actual tax is the mwst_19', '12:00', Colors.yellow),
    User('AN', 'Annie', 'how are my finances', '11:20', Colors.grey),
    User('SA', 'Sara', 'Hi', '11:03', Colors.pink),
    User('NA', 'Naelle', 'okay', '08:50', Colors.blue),
    User('AL', 'Alicia', 'exactly', '8:05', Colors.green)
  ];

  ListTile renderUser(User user) {
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: user.avatarBgColor,
          child: Text(
            user.avatarText,
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(user.userName),
        subtitle: Text(user.lastTaxMessage),
        trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.edit),
              Icon(Icons.delete)
            ]
        ) // Trailing waits the widjet text
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
          title: Text('Users')),
      body: ListView(
        children: userList.map(this.renderUser).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}