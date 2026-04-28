import 'package:flutter/material.dart';

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
  TimeOfDay? selectedTime = TimeOfDay.now();
  //2
  String formattedTime = "";

  @override
  Widget build(BuildContext context)
  {
    IconButton iconButton = IconButton(onPressed: () {

      //3
      selectTime(); },
      icon:Icon(Icons.timer_outlined,size:30,color:Colors.brown,),);

    SizedBox sizedBox = SizedBox(height:60,);

    Text output = Text("Selected time $formattedTime");

    Column column = Column(mainAxisAlignment:MainAxisAlignment.center,children: [iconButton,sizedBox,output],);

    Container container = Container(alignment: Alignment.center,child:column,);

    AppBar appBar = AppBar(title:Text("Appointment Booking"),backgroundColor: Colors.lightBlue,);

    Scaffold scaffold = Scaffold(appBar:appBar,body:container);

    return scaffold;

  }

  //4
  void selectTime() async
  {

    //5
    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        confirmText:"Select this time",
        cancelText:"I'll do it later",
        initialTime: TimeOfDay.now()
    );

    setState(() {
      if(pickedTime!=null)
      {
        selectedTime=pickedTime;

        int hour = selectedTime!.hour;
        int minute = selectedTime!.minute;
        String am_pm = selectedTime!.period == DayPeriod.am ? "AM" : "PM";

        formattedTime = "$hour:$minute $am_pm";
      }
    });

  }





}
