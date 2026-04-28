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
    ElevatedButton elevatedButton = ElevatedButton(onPressed:() { doTask(context); }, child:Text("Show Input Alertdialog"));
    AppBar appBar = AppBar(title:Text("Input Alert demo"),backgroundColor:Colors.red,);
    Center center = Center(child:elevatedButton);

    Scaffold scaffold = Scaffold(appBar:appBar,body:center);
    return scaffold;
  }

  void doTask(BuildContext context)
  {
    //Create TextField...
    TextEditingController textEditingController = TextEditingController();
    TextStyle textStyle = const TextStyle(fontSize:12);
    OutlineInputBorder brd =  OutlineInputBorder(borderRadius:BorderRadius.zero);
    InputDecoration inputDecoration = InputDecoration (border:brd, icon:const Icon(Icons.phone_android_rounded), hintText:"Enter 10-digit mobile no.");
    TextField textField = TextField(controller:textEditingController,style:textStyle,decoration:inputDecoration);


    //Step-1
    ElevatedButton okButton = ElevatedButton(onPressed:()
    {
      String mobile_no = textEditingController.text;
      debugPrint("You have entered $mobile_no");
      Navigator.pop(context);
    }, child:Text("Ok"));

    //Step-2
    AlertDialog alertDialog = AlertDialog(title:Text("Information"),content:textField,actions: [okButton],);

    //Step-3
    showDialog(barrierDismissible:false,context: context, builder: (context){
      return alertDialog;
    });

  }
}
