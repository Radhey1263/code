import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {

    List<ListTile> list = <ListTile>[

      ListTile(subtitle:Text("Profile",textAlign:TextAlign.center,),title:IconButton(onPressed: (){}, icon:Icon(Icons.account_circle_outlined,size:40,))),
      ListTile(subtitle:Text("Schedule",textAlign:TextAlign.center),title:IconButton(onPressed: (){}, icon:Icon(Icons.calendar_month,size:40))),
      ListTile(subtitle:Text("Subscriptions",textAlign:TextAlign.center),title:IconButton(onPressed: (){}, icon:Icon(Icons.subscriptions,size:40,))),
      ListTile(subtitle:Text("Notes",textAlign:TextAlign.center),title:IconButton(onPressed: (){}, icon:Icon(Icons.note_add_outlined,size:40))),
      ListTile(subtitle:Text("Transactions",textAlign:TextAlign.center),title:IconButton(onPressed: (){}, icon:Icon(Icons.currency_exchange,size:40))),
      ListTile(subtitle:Text("Vehicle details",textAlign:TextAlign.center),title:IconButton(onPressed: (){}, icon:Icon(Icons.time_to_leave,size:40,))),
      ListTile(subtitle:Text("Reminders",textAlign:TextAlign.center),title:IconButton(onPressed: (){}, icon:Icon(Icons.schedule,size:40))),
    ];

    SliverGridDelegateWithFixedCrossAxisCount  gridDelegate =
    SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
        mainAxisSpacing:20,
        crossAxisSpacing:20);


      GridView gridView = GridView.builder(itemCount: 7,gridDelegate: gridDelegate, itemBuilder:(context,index){

      return list[index];

      } );


      AppBar appBar = AppBar(title:Text("GridView demo"),backgroundColor:Colors.orangeAccent,);

      Container container = Container(child:gridView);
      Scaffold scaffold = Scaffold(appBar:appBar,body:container);

      MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner: false);

      return materialApp;
  }
}
