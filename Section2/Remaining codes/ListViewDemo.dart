//ListView Demo

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

  List<String> items = List.generate(75, (index)=>"Item-${index+1}");

  @override
  Widget build(BuildContext context)
  {

    ListView listView = ListView.builder(itemCount:items.length,itemBuilder:(context,index){

      ListTile listTile = ListTile(title:Text(items[index]),trailing:IconButton(onPressed:(){

        setState(() {
          items.removeAt(index);
        });

      }, icon: Icon(Icons.delete_forever)));

      debugPrint("Item ${index+1} is created...");

      return listTile;

    });


    Container container = Container(alignment: Alignment.center,child:listView,);


    AppBar appBar = AppBar(title:Text("ListView Demo"),backgroundColor: Colors.lightBlue,);

    Scaffold scaffold = Scaffold(appBar:appBar,body:container);

    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;

  }
}
