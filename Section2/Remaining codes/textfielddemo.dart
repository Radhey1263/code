import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    Text title = Text("TextField Demo");
    AppBar appBar = AppBar(title:title,backgroundColor: Colors.lightBlueAccent,);

    //1. Create style
    TextStyle style = TextStyle(fontSize:14,color:Colors.indigo,fontWeight:FontWeight.bold,fontStyle:FontStyle.italic);

    //2. Create border
    //OutlineInputBorder border = OutlineInputBorder(borderRadius:BorderRadius.circular(100));
    OutlineInputBorder border = OutlineInputBorder();

    //3. Create decoration
    InputDecoration decoration = InputDecoration(border:border,icon:Icon(Icons.smartphone_outlined),labelText:"Mobile No.",hintText:"Enter 10-digit mobile number"  );

    //4. Create TextField
    TextEditingController textEditingController = TextEditingController(); // NEW
    TextField textField = TextField(keyboardType:TextInputType.phone,controller:textEditingController,style:style,decoration:decoration); //NEW

    //5. Create ElevatedButton
    Text buttonLabel = Text("Show mobile number"); //NEW
    ElevatedButton elevatedButton = ElevatedButton(onPressed: () {
      debugPrint(textEditingController.text);
    }, child: buttonLabel); //NEW

    Column column = Column(mainAxisAlignment:MainAxisAlignment.spaceBetween ,children: [textField,elevatedButton],); //NEW

    Container container = Container(alignment:Alignment.center, child:column); //NEW

    Scaffold scaffold = Scaffold(appBar:appBar,body:container);

    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false );

    return materialApp;
  }
}