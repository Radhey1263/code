//Screen-2

import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context)
  {

    AppBar appBar = AppBar(title:Text("Screen-2"),);
    ElevatedButton b1 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s1");

    } , child:Text("Go to Screen-1"));

    ElevatedButton b3 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s3");

    } , child:Text("Go to Screen-3"));

    ElevatedButton b4 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s4");

    } , child:Text("Go to Screen-4"));

    Row row = Row(mainAxisSize: MainAxisSize.max,children: [b1,b3,b4],);

    Center center = Center(child:row);

    Scaffold scaffold = Scaffold(appBar:appBar,body:center,backgroundColor:Colors.blue);

    return scaffold ;
  }
}

