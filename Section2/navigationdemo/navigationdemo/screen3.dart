//Screen-3

import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context)
  {

    AppBar appBar = AppBar(title:Text("Screen-3"),);
    ElevatedButton b1 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s1");

    } , child:Text("Go to Screen-1"));

    ElevatedButton b2 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s2");

    } , child:Text("Go to Screen-2"));

    ElevatedButton b4 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s4");

    } , child:Text("Go to Screen-4"));

    Row row = Row(mainAxisSize: MainAxisSize.max,children: [b1,b2,b4],);

    Center center = Center(child:row);

    Scaffold scaffold = Scaffold(appBar:appBar,body:center,backgroundColor:Colors.deepOrangeAccent);

    return scaffold ;
  }
}

