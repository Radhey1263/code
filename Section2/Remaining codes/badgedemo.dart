import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

 int count=1;

  @override
  Widget build(BuildContext context)
  {
    ElevatedButton btn = ElevatedButton(onPressed: (){

      setState(() {
        count++;
      });

    }, child: Text("Give a missed call"));


    Badge badge = Badge.count(count: count,child: Icon(Icons.call,size: 70,));

    Column column = Column(mainAxisAlignment:MainAxisAlignment.center,children: [btn,SizedBox(height: 50,),badge],);

    Container container = Container(child:column);


    AppBar appBar = AppBar(title:Text("Badge demo"),backgroundColor: Colors.lightBlue,);

    Scaffold scaffold = Scaffold(appBar:appBar,body:container);

    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;

  }
}
