// ============================================================================
// Q11_SCREEN.DART - LOGIN NAVIGATION
// ============================================================================
// Takes user and pass. Checks admin/admin. Navigates to welcome or error.
// ============================================================================

import 'package:flutter/material.dart';

void main()
{
  runApp(const Q11Screen());
}

class Q11Screen extends StatefulWidget {
  const Q11Screen({super.key});

  @override
  State<Q11Screen> createState() => _Q11ScreenState();
}

class _Q11ScreenState extends State<Q11Screen> {
  TextEditingController userCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  String screenState = "Login"; // "Login", "Welcome", "Error"

  @override
  Widget build(BuildContext context) {
    if (screenState == "Welcome") {
      Text welcomeTitle = Text("Welcome");
      AppBar welcomeAppBar = AppBar(title: welcomeTitle, backgroundColor: Colors.lightBlue);
      Text welcomeMsg = Text("Welcome, Admin!", style: TextStyle(fontSize: 30));
      Container welcomeContainer = Container(alignment: Alignment.center, child: welcomeMsg);
      Scaffold welcomeScaffold = Scaffold(appBar: welcomeAppBar, body: welcomeContainer);
      MaterialApp welcomeApp = MaterialApp(home: welcomeScaffold, debugShowCheckedModeBanner: false);
      return welcomeApp;
    }

    if (screenState == "Error") {
      Text errorTitle = Text("Error");
      AppBar errorAppBar = AppBar(title: errorTitle, backgroundColor: Colors.red);
      Text errorMsg = Text("Invalid Credentials", style: TextStyle(fontSize: 20));
      ElevatedButton tryBtn = ElevatedButton(onPressed: () { setState(() { screenState = "Login"; }); }, child: Text("Try again"));
      Column errorCol = Column(mainAxisAlignment: MainAxisAlignment.center, children: [errorMsg, SizedBox(height: 20), tryBtn]);
      Container errorContainer = Container(alignment: Alignment.center, child: errorCol);
      Scaffold errorScaffold = Scaffold(appBar: errorAppBar, body: errorContainer);
      MaterialApp errorApp = MaterialApp(home: errorScaffold, debugShowCheckedModeBanner: false);
      return errorApp;
    }

    Text title = Text("Login");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    OutlineInputBorder border = OutlineInputBorder();
    TextField userTF = TextField(controller: userCtrl, decoration: InputDecoration(border: border, labelText: "Username"));
    TextField passTF = TextField(controller: passCtrl, obscureText: true, decoration: InputDecoration(border: border, labelText: "Password"));

    ElevatedButton btn = ElevatedButton(onPressed: () {
      setState(() {
        if (userCtrl.text == "admin" && passCtrl.text == "admin") {
          screenState = "Welcome";
        } else {
          screenState = "Error";
        }
      });
    }, child: Text("Login"));

    SizedBox space = SizedBox(height: 20);
    Column col = Column(mainAxisAlignment: MainAxisAlignment.center, children: [userTF, space, passTF, space, btn]);

    Container container = Container(alignment: Alignment.center, child: col);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }
}