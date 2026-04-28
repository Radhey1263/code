import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {

    CircleAvatar circleAvatar = CircleAvatar(foregroundImage:AssetImage("images/??.jpg"),radius:40);
    Text text = Text("you@your.org");

    Column column = Column(children: [circleAvatar,text],);

    DrawerHeader drawerHeader = DrawerHeader(child: column);

    ListTile l1 = ListTile(leading:Icon(Icons.fingerprint),title:Text("Attendance") );
    ListTile l2 = ListTile(leading:Icon(Icons.calendar_month),title:Text("Schedule") );
    ListTile l3 = ListTile(leading:Icon(Icons.note_add),title:Text("Result"));

    Divider divider = Divider();

    ListTile l4 = ListTile(onTap:(){ debugPrint("Exit option selected...."); exit(0); },leading:Icon(Icons.exit_to_app),title:Text("Exit") );


    ListView listView = ListView(children: [drawerHeader,l1,l2,l3,divider,l4],);

    Drawer drawer = Drawer(child:listView);

    AppBar appBar = AppBar(title:Text("Drawer Demo"),backgroundColor:Colors.cyanAccent);

    Scaffold scaffold = Scaffold(appBar: appBar,drawer: drawer);

    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }
}
