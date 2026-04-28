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
      Text title = Text("My First Flutter app");
      AppBar appBar = AppBar(title:title,backgroundColor: Colors.lightBlueAccent,);

      Text message = Text("Hello World...");
      Container container = Container(alignment:Alignment.center, child:message);

      Scaffold scaffold = Scaffold(appBar:appBar,body:container);

      MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false );

    return materialApp;
  }
}
