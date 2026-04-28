import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



void main() {
  //IMPORTANT
  runApp(MaterialApp(home:const MyApp(),debugShowCheckedModeBanner:false));
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  //1
  DateTimeRange selectedDateRange = DateTimeRange(start: DateTime.now(), end:  DateTime.now());
  String formattedDate = "";

  @override
  Widget build(BuildContext context)
  {
    IconButton iconButton = IconButton(onPressed: () {
      //2
       selectDateRange(); },
      icon:Icon(Icons.calendar_month_rounded,size:30,color:Colors.brown,),);

    SizedBox sizedBox = SizedBox(height:60,);

    Text output = Text("Hotel booked $formattedDate");

    Column column = Column(mainAxisAlignment:MainAxisAlignment.center,children: [iconButton,sizedBox,output],);

    Container container = Container(alignment: Alignment.center,child:column,);

    AppBar appBar = AppBar(title:Text("Hotel Booking"),backgroundColor: Colors.lightBlue,);

    Scaffold scaffold = Scaffold(appBar:appBar,body:container);

    return scaffold;

  }

  void selectDateRange() async
  {
    int currentYear = DateTime.now().year;

    //3
    DateTimeRange? pickedRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(currentYear,12,31),
    confirmText: "Book stay on selected dates",
    cancelText: "I'll book later",
      saveText: "Book" //4
    );


    setState(() {
      if(pickedRange!=null)
      {
        selectedDateRange=pickedRange;

        //5
        String startDate = DateFormat("dd/MM/yyyy").format(selectedDateRange.start);
        String endDate = DateFormat("dd/MM/yyyy").format(selectedDateRange.end);
        formattedDate = "From $startDate to $endDate";
      }
    });

  } // End of selectDateRange

} // End of class
