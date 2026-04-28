/*
Create an app that calculates EMI for given values of loan amount, term in years and rate of interest.
Minimum loan amount: ₹ 50,000 Maximum loan amount: ₹ 5,00,000.
Minimum term: 1 year Maximum term: 3 years.
Minimum rate of interest: 8% Maximum rate of interest: 12%
Use a slider for each of the above component and show EMI as and when any of them is changed.

 */


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  double amount=100000;
  double roi=8;
  double term=1;
  double emi=0;


  @override
  Widget build(BuildContext context)
  {
    SizedBox sizedBox = SizedBox(height:40);

    SliderThemeData sliderThemeData = SliderThemeData(showValueIndicator:ShowValueIndicator.alwaysVisible);

    Slider slider1 = Slider(min:50000,max:500000,divisions:5,value: amount, onChanged:(value){

      setState(() {

        amount = value;

      });

    });

    SliderTheme sliderTheme1 = SliderTheme(data: sliderThemeData, child: slider1);


    Slider slider2 = Slider(min:1,max:3,divisions:2,value: term, onChanged:(value){

      setState(() {

        term = value;

      });

    });

    SliderTheme sliderTheme2 = SliderTheme(data: sliderThemeData, child: slider2);

    Slider slider3 = Slider(min:8,max:12,divisions:8,value: roi, onChanged:(value){

      setState(() {

        roi = value;

      });

    });

    SliderTheme sliderTheme3 = SliderTheme(data: sliderThemeData, child: slider3);


    Column column1 = Column(mainAxisAlignment:MainAxisAlignment.center,children: [sliderTheme1,sizedBox,sliderTheme2,sizedBox,sliderTheme3]);

    Text t1 = Text("Amount = Rs. $amount");
    Text t2 = Text("Term = $term Year(s)");
    Text t3 = Text("ROI = $roi %");

    emi = (amount + ((amount*roi*term)/100))/ (term*12);

    Text t4 = Text("EMI = Rs. $emi ");

    Column column2 = Column(mainAxisAlignment:MainAxisAlignment.center,children: [t1,sizedBox,t2,sizedBox,t3,sizedBox,t4]);

    Row row = Row(children: [column1,column2]);

    Container container = Container(alignment: Alignment.center,child:row,);

    AppBar appBar = AppBar(title:Text("EMI Calculator"),backgroundColor: Colors.lightBlue,);

    Scaffold scaffold = Scaffold(appBar:appBar,body:container);

    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;

  }
}
