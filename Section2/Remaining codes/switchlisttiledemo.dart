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

  bool v=false;
  String subtitleText="Bulb is OFF";
  Color bulbColor=Colors.grey;


  @override
  Widget build(BuildContext context)
  {
    SwitchListTile switchListTile = SwitchListTile(title:Text("Switch On/Off the bulb."),subtitle:Text(subtitleText),value: v, onChanged: (value){

      setState(() {
        if(value==true)
        {
          subtitleText="Bulb is ON";
          bulbColor=Colors.yellowAccent;
        }
        else
        {
          subtitleText="Bulb is OFF";
          bulbColor=Colors.grey;
        }

        v = value;
      });



      });


    Icon bulb = Icon(Icons.lightbulb,size:100,color:bulbColor);

    Column column = Column(mainAxisAlignment:MainAxisAlignment.center,children: [switchListTile,bulb],);

    Container container = Container(child:column);


    AppBar appBar = AppBar(title:Text("SwitchListTile demo"),backgroundColor: Colors.lightBlue,);

    Scaffold scaffold = Scaffold(appBar:appBar,body:container);

    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;

  }
}
