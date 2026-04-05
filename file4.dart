// ============================================================================
// Q4_SCREEN.DART - NUMBER RANGE
// ============================================================================
// Two textfields for Start and End. ListView displays numbers in range.
// ============================================================================

import 'package:flutter/material.dart';

void main()
{
  runApp(const Q4Screen());
}

class Q4Screen extends StatefulWidget {
  const Q4Screen({super.key});

  @override
  State<Q4Screen> createState() => _Q4ScreenState();
}

class _Q4ScreenState extends State<Q4Screen> {
  TextEditingController startCtrl = TextEditingController();
  TextEditingController endCtrl = TextEditingController();
  List<int> numbers = [];

  @override
  Widget build(BuildContext context) {
    Text title = Text("Number Range");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    OutlineInputBorder border = OutlineInputBorder();
    InputDecoration startDec = InputDecoration(border: border, labelText: "Starting Number");
    TextField startField = TextField(controller: startCtrl, decoration: startDec, keyboardType: TextInputType.number);

    InputDecoration endDec = InputDecoration(border: border, labelText: "Ending Number");
    TextField endField = TextField(controller: endCtrl, decoration: endDec, keyboardType: TextInputType.number);

    Text btnTxt = Text("Show range");
    ElevatedButton btn = ElevatedButton(onPressed: () {
      setState(() {
        numbers.clear();
        int start = int.tryParse(startCtrl.text) ?? 0;
        int end = int.tryParse(endCtrl.text) ?? 0;
        for (int i = start; i <= end; i++) {
          numbers.add(i);
        }
      });
    }, child: btnTxt);

    ListView listView = ListView.builder(
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        Text itemTxt = Text(numbers[index].toString());
        ListTile tile = ListTile(title: itemTxt);
        return tile;
      }
    );

    Expanded expandedList = Expanded(child: listView);
    SizedBox space = SizedBox(height: 20);
    Column col = Column(children: [space, startField, space, endField, space, btn, space, expandedList]);

    Container container = Container(alignment: Alignment.center, child: col);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }
}