//Screen-4

import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context)
  {

    AppBar appBar = AppBar(title:Text("Screen-4"),);
    ElevatedButton b1 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s1");

    } , child:Text("Go to Screen-1"));

    ElevatedButton b2 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s2");

    } , child:Text("Go to Screen-2"));

    ElevatedButton b3 = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s3");

    } , child:Text("Go to Screen-3"));

    Row row = Row(mainAxisSize: MainAxisSize.max,children: [b1,b2,b3],);

    Center center = Center(child:row);

    Scaffold scaffold = Scaffold(appBar:appBar,body:center,backgroundColor:Colors.grey);

    return scaffold ;
  }
}

