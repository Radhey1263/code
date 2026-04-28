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
    ElevatedButton elevatedButton = ElevatedButton(onPressed:() { doTask(context); }, child:Text("Show Confirmation Alertdialog"));
    AppBar appBar = AppBar(title:Text("Confirmation Alert demo"),backgroundColor:Colors.lightGreenAccent);
    Center center = Center(child:elevatedButton);

    Scaffold scaffold = Scaffold(appBar:appBar,body:center);
    return scaffold;
  }

  void doTask(BuildContext context)
  {
    //Step-1
    ElevatedButton okButton = ElevatedButton(onPressed:()
    {
      debugPrint("Record deleted successfully....");
      Navigator.pop(context);
    }, child:Text("Ok"));

    ElevatedButton cancelButton = ElevatedButton(onPressed:(){
      debugPrint("Operation cancelled....");
      Navigator.pop(context);
    }, child:Text("Cancel"));


    //Step-2
    AlertDialog alertDialog = AlertDialog(title:Text("Confirmation"),content:Text("Do you really want to delete record(s)?"),actions: [okButton,cancelButton],);

    //Step-3
    showDialog(barrierDismissible:false,context: context, builder: (context){
      return alertDialog;
    });

  }
}
