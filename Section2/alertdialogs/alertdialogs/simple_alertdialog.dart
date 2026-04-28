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
    ElevatedButton elevatedButton = ElevatedButton(onPressed:() { doTask(context); }, child:Text("Show Simple Alertdialog"));
    AppBar appBar = AppBar(title:Text("Simple Alert demo"),backgroundColor:Colors.amber,);
    Center center = Center(child:elevatedButton);

    Scaffold scaffold = Scaffold(appBar:appBar,body:center);
    return scaffold;
  }

  void doTask(BuildContext context)
  {
    //Step-1
    ElevatedButton okButton = ElevatedButton(onPressed:(){
      Navigator.pop(context);
    }, child:Text("Ok"));

    //Step-2
    AlertDialog alertDialog = AlertDialog(title:Text("Information"),content:Text("Task performed successfully."),actions: [okButton],);

    //Step-3
    showDialog(barrierDismissible:false,context: context, builder: (context){
      return alertDialog;
    });

  }
}
