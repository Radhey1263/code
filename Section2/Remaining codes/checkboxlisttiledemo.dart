import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 bool v1=false;
 bool v2=false;

  @override
  Widget build(BuildContext context)
  {

    debugPrint("build() is called");

   CheckboxListTile c1 = CheckboxListTile(secondary:Icon(Icons.code,size: 25,),controlAffinity:ListTileControlAffinity.leading,title:Text("Flutter"),subtitle:Text("A framework by Google"),value: v1, onChanged: (value){

    setState(() {
      if(value==true)
        {
          debugPrint("c1 is checked");
        }
      else {
        debugPrint("c1 is not checked");
      }

      v1=value!; //Null assertion operator

    });
   } );

    CheckboxListTile c2 = CheckboxListTile(secondary:Icon(Icons.get_app_rounded,size: 25,),controlAffinity:ListTileControlAffinity.leading,title:Text("Python"),subtitle:Text("USed in AI-ML-DL"),value: v2, onChanged: (value){

      setState(() {
        if(value==true)
        {
          debugPrint("c2 is checked");
        }
        else {
          debugPrint("c2 is not checked");
        }
        v2=value!; //Null assertion operator

      });
    } );

    Column column = Column(children: [c1,c2],);

    Container container = Container(child:column);
    AppBar appBar = AppBar(title:Text("CheckboxListTile demo"),backgroundColor: Colors.lightBlue,);
    Scaffold scaffold = Scaffold(appBar:appBar,body:container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);
    return materialApp;

  }
}
