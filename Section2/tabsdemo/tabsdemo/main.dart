import 'package:flutter/material.dart';
import 'trains.dart';
import 'flights.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    Tab tab1 = Tab(text:"Train timings",icon:Icon(Icons.train_outlined,size:50,color:Colors.red ,) ,);
    Tab tab2 = Tab(text:"Flight timings",icon:Icon(Icons.flight,size:50,color:Colors.black87 ,) ,);

    TabBar tabBar = TabBar(tabs:[tab1,tab2] );

    AppBar appBar = AppBar(title:Text("Tabs demo"),bottom:tabBar,backgroundColor:Colors.grey,);

    TabBarView tabBarView = TabBarView(children:[Trains(),Flights()]);

    Scaffold scaffold = Scaffold(appBar:appBar,body:tabBarView);

    DefaultTabController defaultTabController = DefaultTabController(length: 2, child: scaffold);

    MaterialApp materialApp =MaterialApp(home:defaultTabController,debugShowCheckedModeBanner:false,);

    return materialApp;
  }
}



