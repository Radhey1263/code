import 'package:flutter/material.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    MaterialApp materialApp = MaterialApp(home:Screen1(),routes:{

      "/s1":(context)=>const Screen1(),
      "/s2":(context)=>const Screen2(),
      "/s3":(context)=>const Screen3(),

    } ,debugShowCheckedModeBanner:false ,);

    return materialApp;
  }
}
