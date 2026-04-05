// ============================================================================
// Q12_SCREEN.DART - BULB CONTROL
// ============================================================================
// Checkboxes control bulb icon colors.
// ============================================================================

import 'package:flutter/material.dart';

void main()
{
  runApp(const Q12Screen());
}

class Q12Screen extends StatefulWidget {
  const Q12Screen({super.key});

  @override
  State<Q12Screen> createState() => _Q12ScreenState();
}

class _Q12ScreenState extends State<Q12Screen> {
  bool hall = false;
  bool kitchen = false;
  bool bed = false;
  bool lobby = false;

  @override
  Widget build(BuildContext context) {
    Text title = Text("Bulb Control");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    CheckboxListTile cb1 = CheckboxListTile(title: Text("Hall"), value: hall, onChanged: (val) { setState(() { hall = val!; }); });
    CheckboxListTile cb2 = CheckboxListTile(title: Text("Kitchen"), value: kitchen, onChanged: (val) { setState(() { kitchen = val!; }); });
    CheckboxListTile cb3 = CheckboxListTile(title: Text("Bedroom"), value: bed, onChanged: (val) { setState(() { bed = val!; }); });
    CheckboxListTile cb4 = CheckboxListTile(title: Text("Lobby"), value: lobby, onChanged: (val) { setState(() { lobby = val!; }); });

    Icon i1 = Icon(Icons.lightbulb, size: 80, color: hall ? Colors.yellow : Colors.grey);
    Icon i2 = Icon(Icons.lightbulb, size: 80, color: kitchen ? Colors.yellow : Colors.grey);
    Icon i3 = Icon(Icons.lightbulb, size: 80, color: bed ? Colors.yellow : Colors.grey);
    Icon i4 = Icon(Icons.lightbulb, size: 80, color: lobby ? Colors.yellow : Colors.grey);

    Row iconRow = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [i1, i2, i3, i4]);
    SizedBox space = SizedBox(height: 40);
    Column col = Column(children: [cb1, cb2, cb3, cb4, space, iconRow]);

    Container container = Container(alignment: Alignment.center, child: col);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }
}