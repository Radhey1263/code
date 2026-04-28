import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    TextEditingController tec1 = TextEditingController();
    TextEditingController tec2 = TextEditingController();

    TextStyle textStyle = TextStyle(fontSize:16,color:Colors.deepPurple);
    OutlineInputBorder border = OutlineInputBorder(borderRadius:BorderRadius.circular(100) );
    InputDecoration inputDecoration1 = InputDecoration(border:border,icon:Icon(Icons.person,size:30),
        label:Text("Username"));

    TextField tf1 = TextField(controller:tec1,style:textStyle,decoration:inputDecoration1,);

    InputDecoration inputDecoration2 = InputDecoration(border:border,icon:Icon(Icons.password_outlined,size:30),
        label:Text("Password"));
    TextField tf2 = TextField(controller:tec2,obscureText:true,style:textStyle,decoration:inputDecoration2);

    SizedBox sizedBox = SizedBox(height:40);
    Column column1 = Column(crossAxisAlignment:CrossAxisAlignment.center,children: [tf1,sizedBox,tf2],);

    ElevatedButton btnLogin = ElevatedButton(onPressed: () {

      String username = tec1.text;
      String password = tec2.text;

      if(username=="admin" && password=="admin")
        {
          debugPrint("Login successful");

        }
      else
        {
          debugPrint("Login Failed. Try again.");
          tec2.clear();
                  }

    }, child:Text("Submit"));
    ElevatedButton btnReset = ElevatedButton(onPressed: () {

      tec1.clear();
      tec2.clear();

    }, child:Text("Reset"));

    Row row = Row(crossAxisAlignment:CrossAxisAlignment.center,children: [btnLogin,sizedBox,btnReset],);

    Column column2 = Column(crossAxisAlignment:CrossAxisAlignment.center,mainAxisSize:MainAxisSize.min,
        children: [column1,row]);

    AppBar appBar = AppBar(title:Text("Login"),backgroundColor: Colors.lightBlue,);
    Scaffold scaffold = Scaffold(appBar:appBar,body:column2);
    MaterialApp materialApp = MaterialApp(theme:ThemeData.dark(),home:scaffold,debugShowCheckedModeBanner:false);
    return materialApp;


  }
}
