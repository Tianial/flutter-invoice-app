import 'package:flutter/material.dart';

import '../models/chat.dart';

class MyKundenPage extends StatelessWidget {
  final List<Chat> chatList = [
    Chat('RO', 'Rosine', 'Hello, Flutter dose bien 👍', '12:25', Colors.red),
    Chat('MO', 'Monthe', 'On dit quoi ? 👀', '12:08', Colors.blue),
    Chat('LO', 'Loic', 'Hello', '12:00', Colors.yellow),
    Chat('AN', 'Annie', 'how are you', '11:20', Colors.grey),
    Chat('SA', 'Sara', 'Hi', '11:03', Colors.pink),
    Chat('NA', 'Naelle', 'Oups', '08:50', Colors.blue),
    Chat('AL', 'Alicia', 'Vrai?', '8:05', Colors.green)
  ];

  /// Render a [ListTile] (Chat Item) from a [Chat]
  ///
  ListTile renderChat(Chat chat) {
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: chat.avatarBgColor,
          child: Text(
            chat.avatarText,
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(chat.personName),
        subtitle: Text(chat.lastMessage),
        trailing: new Icon(Icons.edit) // Trailing waits the widjet text
        );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Kunden')),
      body: ListView(
        children: chatList.map(this.renderChat).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
