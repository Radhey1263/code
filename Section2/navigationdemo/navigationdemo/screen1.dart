//Screen-1

import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context)
  {

    AppBar appBar = AppBar(title:Text("Screen-1"),);
    ElevatedButton b2 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s2");

    } , child:Text("Go to Screen-2"));

    ElevatedButton b3 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s3");

    } , child:Text("Go to Screen-3"));

    ElevatedButton b4 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s4");

    } , child:Text("Go to Screen-4"));

    Row row = Row(mainAxisSize: MainAxisSize.max,children: [b2,b3,b4],);

    Center center = Center(child:row);

    Scaffold scaffold = Scaffold(appBar:appBar,body:center,backgroundColor:Colors.cyan,);

    return scaffold ;
  }
}

