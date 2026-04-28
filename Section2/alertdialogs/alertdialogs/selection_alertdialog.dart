import 'package:flutter/material.dart';

void main()
{
  MaterialApp materialApp = MaterialApp(home:const MyApp(),debugShowCheckedModeBanner:false);
  runApp(materialApp);
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    ElevatedButton elevatedButton = ElevatedButton(onPressed:() { doTask(context); }, child:Text("Show Selection Alertdialog"));
    AppBar appBar = AppBar(title:Text("Selection Alert demo"),backgroundColor:Colors.purple);
    Center center = Center(child:elevatedButton);

    Scaffold scaffold = Scaffold(appBar:appBar,body:center);
    return scaffold;
  }

  void doTask(BuildContext context)
  {
    //Create List...

    ListTile l1 = ListTile(title:Text("Option-1"),onTap:(){ debugPrint("Option-1 selected...");} ,);
    ListTile l2 = ListTile(title:Text("Option-2"),onTap:(){ debugPrint("Option-2 selected...");});
    ListTile l3 = ListTile(title:Text("Option-3"),onTap:(){ debugPrint("Option-3 selected...");});
    ListTile l4 = ListTile(title:Text("Option-4"),onTap:(){ debugPrint("Option-4 selected...");});

    ListView listView = ListView(children: [l1,l2,l3,l4],);

    //Step-1
    ElevatedButton okButton = ElevatedButton(onPressed:()
    {
      Navigator.pop(context);
    }, child:Text("Ok"));

    //Step-2
    AlertDialog alertDialog = AlertDialog(title:Text("Selection any one option"),content:SizedBox(height:200,width:100,child:listView,));

    //Step-3
    showDialog(barrierDismissible:false,context: context, builder: (context){
      return alertDialog;
    });

  }
}
