// ============================================================================
// Q1_SCREEN.DART - STUDENT FORM
// ============================================================================
// This screen creates a Student Registration Form with:
//   1. TextField for Student ID
//   2. DatePicker (via IconButton) to select Date of Birth
//   3. Three Checkboxes for skills: Flutter, Java, .NET
//   4. "Show" button that displays all entered information in a TextField
// ============================================================================

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main()
{
  MaterialApp materialApp = MaterialApp(home: Q1Screen(), debugShowCheckedModeBanner: false);
  runApp(materialApp);
}

class Q1Screen extends StatefulWidget {
  const Q1Screen({super.key});

  @override
  State<Q1Screen> createState() => _Q1ScreenState();
}

class _Q1ScreenState extends State<Q1Screen> {
  TextEditingController studentIdController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool flutter = false;
  bool java = false;
  bool dotnet = false;
  String outputText = "";

  @override
  Widget build(BuildContext context) {
    Text title = Text("Student Form");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    OutlineInputBorder border = OutlineInputBorder();
    InputDecoration inputDecoration = InputDecoration(border: border, labelText: "Student ID");
    TextField studentIdField = TextField(controller: studentIdController, decoration: inputDecoration);

    IconButton dateButton = IconButton(onPressed: () { selectDate(); }, icon: Icon(Icons.calendar_month, size: 30));
    String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
    Text dateText = Text("Date of Birth: $formattedDate");
    Row dateRow = Row(children: [dateButton, dateText]);

    Text skillsLabel = Text("Select Skills:");
    CheckboxListTile c1 = CheckboxListTile(controlAffinity: ListTileControlAffinity.leading, title: Text("Flutter"), value: flutter, onChanged: (value) { setState(() { flutter = value!; }); });
    CheckboxListTile c2 = CheckboxListTile(controlAffinity: ListTileControlAffinity.leading, title: Text("Java"), value: java, onChanged: (value) { setState(() { java = value!; }); });
    CheckboxListTile c3 = CheckboxListTile(controlAffinity: ListTileControlAffinity.leading, title: Text(".NET"), value: dotnet, onChanged: (value) { setState(() { dotnet = value!; }); });

    Text btnText = Text("Show");
    ElevatedButton showButton = ElevatedButton(onPressed: () {
      setState(() {
        String studentId = studentIdController.text;
        String skills = "";
        if (flutter) skills += "Flutter, ";
        if (java) skills += "Java, ";
        if (dotnet) skills += ".NET, ";
        if (skills.isNotEmpty) skills = skills.substring(0, skills.length - 2);

        outputText = "Student Id: $studentId\nDate of Birth: $formattedDate\nSkills: $skills";
      });
    }, child: btnText);

    InputDecoration outputDecoration = InputDecoration(border: border);
    TextField outputField = TextField(controller: TextEditingController(text: outputText), decoration: outputDecoration, maxLines: 5, readOnly: true);

    SizedBox sizedBox = SizedBox(height: 15);
    Column column = Column(children: [sizedBox, studentIdField, sizedBox, dateRow, sizedBox, skillsLabel, c1, c2, c3, sizedBox, showButton, sizedBox, outputField]);

    SingleChildScrollView scrollView = SingleChildScrollView(child: column);
    Container container = Container(alignment: Alignment.center, child: scrollView);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);

    return scaffold;
  }

  Future selectDate() async {
    DateTime? pickedDate = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1990, 1, 1), lastDate: DateTime.now());
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}