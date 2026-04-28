// ============================================================================
// Q3_SCREEN.DART - LOGIN WITH PIN
// ============================================================================
// Username field and 4 TextFields for PIN. Checks for admin/2121.
// Shows Welcome screen on success, clears fields on Reset.
// ============================================================================

import 'package:flutter/material.dart';

void main()
{
  runApp(const Q3Screen());
}

class Q3Screen extends StatefulWidget {
  const Q3Screen({super.key});

  @override
  State<Q3Screen> createState() => _Q3ScreenState();
}

class _Q3ScreenState extends State<Q3Screen> {
  TextEditingController userCtrl = TextEditingController();
  TextEditingController pin1Ctrl = TextEditingController();
  TextEditingController pin2Ctrl = TextEditingController();
  TextEditingController pin3Ctrl = TextEditingController();
  TextEditingController pin4Ctrl = TextEditingController();
  
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      Text welcomeTitle = Text("Welcome");
      AppBar welcomeAppBar = AppBar(title: welcomeTitle, backgroundColor: Colors.lightBlue);
      Text welcomeTxt = Text("Welcome", style: TextStyle(fontSize: 30));
      Container welcomeContainer = Container(alignment: Alignment.center, child: welcomeTxt);
      Scaffold welcomeScaffold = Scaffold(appBar: welcomeAppBar, body: welcomeContainer);
      MaterialApp welcomeApp = MaterialApp(home: welcomeScaffold, debugShowCheckedModeBanner: false);
      return welcomeApp;
    }

    Text title = Text("Login");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    OutlineInputBorder border = OutlineInputBorder();
    InputDecoration userDec = InputDecoration(border: border, labelText: "Username");
    TextField userField = TextField(controller: userCtrl, decoration: userDec);

    InputDecoration pinDec = InputDecoration(border: border);
    SizedBox pinBox1 = SizedBox(width: 50, child: TextField(controller: pin1Ctrl, decoration: pinDec, textAlign: TextAlign.center));
    SizedBox pinBox2 = SizedBox(width: 50, child: TextField(controller: pin2Ctrl, decoration: pinDec, textAlign: TextAlign.center));
    SizedBox pinBox3 = SizedBox(width: 50, child: TextField(controller: pin3Ctrl, decoration: pinDec, textAlign: TextAlign.center));
    SizedBox pinBox4 = SizedBox(width: 50, child: TextField(controller: pin4Ctrl, decoration: pinDec, textAlign: TextAlign.center));

    Row pinRow = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [pinBox1, pinBox2, pinBox3, pinBox4]);

    Text loginTxt = Text("Login");
    ElevatedButton loginBtn = ElevatedButton(onPressed: () {
      setState(() {
        String user = userCtrl.text;
        String pin = pin1Ctrl.text + pin2Ctrl.text + pin3Ctrl.text + pin4Ctrl.text;
        
        if (user == "admin" && pin == "2121") {
          isLoggedIn = true;
        } else {
          debugPrint("Invalid Credentials");
        }
      });
    }, child: loginTxt);

    Text resetTxt = Text("Reset");
    ElevatedButton resetBtn = ElevatedButton(onPressed: () {
      setState(() {
        userCtrl.clear();
        pin1Ctrl.clear();
        pin2Ctrl.clear();
        pin3Ctrl.clear();
        pin4Ctrl.clear();
      });
    }, child: resetTxt);

    Row btnRow = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [loginBtn, resetBtn]);

    SizedBox space = SizedBox(height: 30);
    Column col = Column(mainAxisAlignment: MainAxisAlignment.center, children: [userField, space, pinRow, space, btnRow]);

    Container container = Container(alignment: Alignment.center, child: col);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }
}