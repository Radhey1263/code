//Screen-2 : Login Screen

import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context)
  {
    TextEditingController tecUsername = TextEditingController();
    TextEditingController tecPassword = TextEditingController();

    TextStyle textStyle = TextStyle(fontSize:16,color:Colors.deepPurple);
    OutlineInputBorder border = OutlineInputBorder(borderRadius:BorderRadius.circular(100));

    InputDecoration inputDecoration1 = InputDecoration(border:border,icon:Icon(Icons.person,size:30),
        label:Text("Username"));
    TextField tf1 = TextField(controller:tecUsername,style:textStyle,decoration:inputDecoration1);

    InputDecoration inputDecoration2 = InputDecoration(border:border,icon:Icon(Icons.password_outlined,size:30),
        label:Text("Password"));
    TextField tf2 = TextField(controller:tecPassword,obscureText:true,style:textStyle,decoration:inputDecoration2);

    SizedBox sizedBox = SizedBox(height:20);

    ElevatedButton btnLogin = ElevatedButton(onPressed:(){

      String username = tecUsername.text;
      String password = tecPassword.text;

      if(username=="admin" && password=="admin")
      {
        debugPrint("Login Successful!");

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text("Login Successful! Welcome $username"))
        );

        Navigator.pushNamed(context,"/s3");
      }
      else
      {
        debugPrint("Login Failed. Try again.");

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text("Invalid Username or Password! Try again."))
        );

        tecPassword.clear();
      }

    } , child:Text("Login"));

    ElevatedButton btnReset = ElevatedButton(onPressed:(){

      tecUsername.clear();
      tecPassword.clear();

    } , child:Text("Reset"));

    ElevatedButton btnGoToRegister = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s1");

    } , child:Text("Don't have account? Register"));

    Row row = Row(mainAxisAlignment:MainAxisAlignment.center,children: [btnLogin,SizedBox(width:20),btnReset]);

    Column column = Column(mainAxisAlignment:MainAxisAlignment.center,children: [
      tf1,sizedBox,tf2,sizedBox,row,sizedBox,btnGoToRegister
    ]);

    Padding padding = Padding(padding:EdgeInsets.all(20),child:column);

    Center center = Center(child:padding);

    AppBar appBar = AppBar(title:Text("Login"),backgroundColor:Colors.lightBlue);

    Scaffold scaffold = Scaffold(appBar:appBar,body:center,backgroundColor:Colors.blue.shade50);

    return scaffold;
  }
}
