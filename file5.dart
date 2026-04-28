// ============================================================================
// Q5_SCREEN.DART - ATTENDANCE APP
// ============================================================================
// DatePicker, Subject Dropdown, Checkboxes for present/absent.
// Submit outputs list in TextFields and shows count in Badges.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main()
{
  MaterialApp materialApp = MaterialApp(home: Q5Screen(), debugShowCheckedModeBanner: false);
  runApp(materialApp);
}

class Q5Screen extends StatefulWidget {
  const Q5Screen({super.key});

  @override
  State<Q5Screen> createState() => _Q5ScreenState();
}

class _Q5ScreenState extends State<Q5Screen> {
  DateTime selectedDate = DateTime.now();
  String selectedSubject = "Maths";
  List<String> mathsStudents = ["Vikas", "Tanisha", "Ved", "Rucha", "Dev"];
  List<String> scienceStudents = ["Rohan", "Harsh", "Vihan", "Chinar", "Pavan"];
  List<bool> attendance = [false, false, false, false, false];
  
  String presentText = "";
  String absentText = "";
  int presentCount = 0;
  int absentCount = 0;

  @override
  Widget build(BuildContext context) {
    Text title = Text("Attendance App");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
    Text dateText = Text("Date: $formattedDate");
    IconButton dateBtn = IconButton(onPressed: () { selectDate(); }, icon: Icon(Icons.calendar_month));
    Row dateRow = Row(children: [dateText, dateBtn]);

    DropdownMenuEntry<String> opt1 = DropdownMenuEntry(value: "Maths", label: "Maths");
    DropdownMenuEntry<String> opt2 = DropdownMenuEntry(value: "Science", label: "Science");
    DropdownMenu dropdown = DropdownMenu(dropdownMenuEntries: [opt1, opt2], initialSelection: "Maths", onSelected: (val) {
      setState(() {
        selectedSubject = val.toString();
        attendance = [false, false, false, false, false];
      });
    });

    List<String> currentList = selectedSubject == "Maths" ? mathsStudents : scienceStudents;
    
    ListView studentList = ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return CheckboxListTile(
          title: Text(currentList[index]),
          value: attendance[index],
          onChanged: (val) { setState(() { attendance[index] = val!; }); }
        );
      }
    );

    Text submitTxt = Text("Submit");
    ElevatedButton submitBtn = ElevatedButton(onPressed: () {
      setState(() {
        presentText = "Date: $formattedDate, Subject: $selectedSubject\nPresent Students:\n";
        absentText = "Date: $formattedDate, Subject: $selectedSubject\nAbsent Students:\n";
        presentCount = 0;
        absentCount = 0;
        for (int i = 0; i < 5; i++) {
          if (attendance[i]) {
            presentText += "${currentList[i]}\n";
            presentCount++;
          } else {
            absentText += "${currentList[i]}\n";
            absentCount++;
          }
        }
      });
    }, child: submitTxt);

    Text resetTxt = Text("Reset");
    ElevatedButton resetBtn = ElevatedButton(onPressed: () {
      setState(() {
        attendance = [false, false, false, false, false];
        presentText = ""; absentText = "";
        presentCount = 0; absentCount = 0;
      });
    }, child: resetTxt);

    Row btnRow = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [submitBtn, resetBtn]);

    Badge presentBadge = Badge.count(count: presentCount, child: Text("Present", style: TextStyle(fontSize: 16)));
    Badge absentBadge = Badge.count(count: absentCount, child: Text("Absent", style: TextStyle(fontSize: 16)));
    Row badgeRow = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [presentBadge, absentBadge]);

    TextField presField = TextField(controller: TextEditingController(text: presentText), maxLines: 4, readOnly: true, decoration: InputDecoration(border: OutlineInputBorder()));
    TextField absField = TextField(controller: TextEditingController(text: absentText), maxLines: 4, readOnly: true, decoration: InputDecoration(border: OutlineInputBorder()));
    
    Expanded exp1 = Expanded(child: presField);
    SizedBox wSpace = SizedBox(width: 10);
    Expanded exp2 = Expanded(child: absField);
    Row outRow = Row(children: [exp1, wSpace, exp2]);

    SizedBox space = SizedBox(height: 10);
    Column col = Column(children: [dateRow, dropdown, studentList, btnRow, space, badgeRow, space, outRow]);

    SingleChildScrollView scroll = SingleChildScrollView(child: col);
    Container container = Container(alignment: Alignment.center, padding: EdgeInsets.all(8), child: scroll);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);

    return scaffold;
  }

  Future selectDate() async {
    DateTime now = DateTime.now();
    DateTime tomorrow = now.add(Duration(days: 1));
    DateTime? picked = await showDatePicker(context: context, initialDate: now, firstDate: now, lastDate: tomorrow);
    if (picked != null) setState(() { selectedDate = picked; });
  }
}