import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  MaterialApp materialApp = MaterialApp(home:MyApp(),debugShowCheckedModeBanner:false);
  runApp(materialApp);
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    IconButton iconButton = IconButton(onPressed: () {
      selectDate();
    }, icon: Icon(Icons.calendar_month_rounded, size: 25,));


    SizedBox sizedBox = SizedBox(height: 40);

    String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);

    Text output = Text("Selected date is $formattedDate");


    Column column = Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [iconButton, sizedBox,output ],);

    Container container = Container(
      alignment: Alignment.center, child: column,);


    AppBar appBar = AppBar(
      title: Text("???"), backgroundColor: Colors.lightBlue,);

    Scaffold scaffold = Scaffold(appBar: appBar, body: container);

    return scaffold;
  }


  Future selectDate() async
  {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2026, 2, 15),
        lastDate: DateTime(2026, 3, 15),
        helpText: "Select a date for appointment",
        cancelText: "I'll book it later",
        confirmText: "Book on selected date."
    );

    setState(() {
      selectedDate = pickedDate as DateTime;
    });
  }


}