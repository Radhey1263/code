import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {


    AppBar appBar = AppBar(title:Text("NavigationBar Demo"),backgroundColor: Colors.lightBlue,);

    NavigationDestination option1 = NavigationDestination(icon:Icon(Icons.flight,size:50,) , label: "Flights");
    NavigationDestination option2 = NavigationDestination(icon:Icon(Icons.train_outlined,size:50,) , label: "Trains");
    NavigationDestination option3 = NavigationDestination(icon:Icon(Icons.bus_alert_sharp,size:50,) , label: "Buses");

    NavigationBar navigationBar = NavigationBar(destinations:[option1,option2,option3]);

    Scaffold scaffold = Scaffold(appBar:appBar,bottomNavigationBar:navigationBar);

    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;


  }
}

