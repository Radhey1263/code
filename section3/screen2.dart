import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController userCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  String screenState = "Login"; // "Login", "Error"

  @override
  Widget build(BuildContext context) {
    if (screenState == "Error") {
      Text errorTitle = Text("Error");
      AppBar errorAppBar = AppBar(title: errorTitle, backgroundColor: Colors.red);
      Text errorMsg = Text("Invalid Credentials", style: TextStyle(fontSize: 20));
      ElevatedButton tryBtn = ElevatedButton(onPressed: () { setState(() { screenState = "Login"; }); }, child: Text("Try again"));
      Column errorCol = Column(mainAxisAlignment: MainAxisAlignment.center, children: [errorMsg, SizedBox(height: 20), tryBtn]);
      Container errorContainer = Container(alignment: Alignment.center, child: errorCol);
      Scaffold errorScaffold = Scaffold(appBar: errorAppBar, body: errorContainer);
      return errorScaffold;
    }

    Text title = Text("Login");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    OutlineInputBorder border = OutlineInputBorder();
    TextField userTF = TextField(controller: userCtrl, decoration: InputDecoration(border: border, labelText: "Username"));
    TextField passTF = TextField(controller: passCtrl, obscureText: true, decoration: InputDecoration(border: border, labelText: "Password"));

    ElevatedButton btn = ElevatedButton(onPressed: () {
      if (userCtrl.text == "admin" && passCtrl.text == "admin") {
        Navigator.pushNamed(context, '/s3');
      } else {
        setState(() {
          screenState = "Error";
        });
      }
    }, child: Text("Login"));

    SizedBox space = SizedBox(height: 20);
    Column col = Column(mainAxisAlignment: MainAxisAlignment.center, children: [userTF, space, passTF, space, btn]);

    Container container = Container(alignment: Alignment.center, child: col);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);

    return scaffold;
  }
}
