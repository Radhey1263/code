//Screen-1 : Registration Screen

import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context)
  {
    TextEditingController tecName = TextEditingController();
    TextEditingController tecEmail = TextEditingController();
    TextEditingController tecUsername = TextEditingController();
    TextEditingController tecPassword = TextEditingController();

    TextStyle textStyle = TextStyle(fontSize:16,color:Colors.deepPurple);
    OutlineInputBorder border = OutlineInputBorder(borderRadius:BorderRadius.circular(100));

    InputDecoration inputDecoration1 = InputDecoration(border:border,icon:Icon(Icons.person,size:30),
        label:Text("Full Name"));
    TextField tf1 = TextField(controller:tecName,style:textStyle,decoration:inputDecoration1);

    InputDecoration inputDecoration2 = InputDecoration(border:border,icon:Icon(Icons.email,size:30),
        label:Text("Email"));
    TextField tf2 = TextField(controller:tecEmail,style:textStyle,decoration:inputDecoration2);

    InputDecoration inputDecoration3 = InputDecoration(border:border,icon:Icon(Icons.account_circle,size:30),
        label:Text("Username"));
    TextField tf3 = TextField(controller:tecUsername,style:textStyle,decoration:inputDecoration3);

    InputDecoration inputDecoration4 = InputDecoration(border:border,icon:Icon(Icons.password_outlined,size:30),
        label:Text("Password"));
    TextField tf4 = TextField(controller:tecPassword,obscureText:true,style:textStyle,decoration:inputDecoration4);

    SizedBox sizedBox = SizedBox(height:20);

    ElevatedButton btnRegister = ElevatedButton(onPressed:(){

      String name = tecName.text;
      String email = tecEmail.text;
      String username = tecUsername.text;
      String password = tecPassword.text;

      if(name.isNotEmpty && email.isNotEmpty && username.isNotEmpty && password.isNotEmpty)
      {
        debugPrint("Registration Successful!");
        debugPrint("Name: $name, Email: $email, Username: $username");

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text("Registration Successful! Go to Login."))
        );

        Navigator.pushNamed(context,"/s2");
      }
      else
      {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text("Please fill all fields!"))
        );
      }

    } , child:Text("Register"));

    ElevatedButton btnReset = ElevatedButton(onPressed:(){

      tecName.clear();
      tecEmail.clear();
      tecUsername.clear();
      tecPassword.clear();

    } , child:Text("Reset"));

    ElevatedButton btnGoToLogin = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s2");

    } , child:Text("Already have account? Login"));

    Row row = Row(mainAxisAlignment:MainAxisAlignment.center,children: [btnRegister,SizedBox(width:20),btnReset]);

    Column column = Column(mainAxisAlignment:MainAxisAlignment.center,children: [
      tf1,sizedBox,tf2,sizedBox,tf3,sizedBox,tf4,sizedBox,row,sizedBox,btnGoToLogin
    ]);

    Padding padding = Padding(padding:EdgeInsets.all(20),child:column);

    Center center = Center(child:padding);

    AppBar appBar = AppBar(title:Text("Registration"),backgroundColor:Colors.lightBlue);

    Scaffold scaffold = Scaffold(appBar:appBar,body:center,backgroundColor:Colors.cyan.shade50);

    return scaffold;
  }
}
