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
    Text title = Text("Exploring AppBar widget");
    IconButton exitIcon = IconButton(onPressed: (){ exit(0); }, icon: Icon(Icons.exit_to_app_sharp));

    AppBar appBar = AppBar(leading:Icon(Icons.ac_unit),title:title,backgroundColor: Colors.lightBlueAccent,actions: [exitIcon],);

    Text message = Text("Look up at the AppBar");
    Container container = Container(alignment:Alignment.center, child:message);

    Icon icon = Icon(Icons.exit_to_app);
    FloatingActionButton fab = FloatingActionButton(child:icon,onPressed: (){exit(0); });

    Scaffold scaffold = Scaffold(floatingActionButton:fab,appBar:appBar,body:container);

    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false );

    return materialApp;
  }
}