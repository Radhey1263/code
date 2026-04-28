//Screen-3 : EMI Calculator with Sliders

import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3>
{

  double amount=100000;
  double roi=8;
  double term=1;
  double emi=0;

  @override
  Widget build(BuildContext context)
  {
    SizedBox sizedBox = SizedBox(height:30);

    SliderThemeData sliderThemeData = SliderThemeData(showValueIndicator:ShowValueIndicator.alwaysVisible);

    //Slider-1 : Loan Amount
    Slider slider1 = Slider(label:"Rs. ${amount.toStringAsFixed(0)}",min:50000,max:500000,divisions:9,value: amount, onChanged:(value){

      setState(() {

        amount = value;

      });

    });

    SliderTheme sliderTheme1 = SliderTheme(data: sliderThemeData, child: slider1);

    //Slider-2 : Term in Years
    Slider slider2 = Slider(label:"${term.toStringAsFixed(0)} Year(s)",min:1,max:3,divisions:2,value: term, onChanged:(value){

      setState(() {

        term = value;

      });

    });

    SliderTheme sliderTheme2 = SliderTheme(data: sliderThemeData, child: slider2);

    //Slider-3 : Rate of Interest
    Slider slider3 = Slider(label:"${roi.toStringAsFixed(1)} %",min:8,max:12,divisions:8,value: roi, onChanged:(value){

      setState(() {

        roi = value;

      });

    });

    SliderTheme sliderTheme3 = SliderTheme(data: sliderThemeData, child: slider3);

    //EMI Calculation
    emi = (amount + ((amount*roi*term)/100))/ (term*12);

    Text t1 = Text("Loan Amount = Rs. ${amount.toStringAsFixed(0)}",style:TextStyle(fontSize:16,fontWeight:FontWeight.bold));
    Text t2 = Text("Term = ${term.toStringAsFixed(0)} Year(s)",style:TextStyle(fontSize:16,fontWeight:FontWeight.bold));
    Text t3 = Text("Rate of Interest = ${roi.toStringAsFixed(1)} %",style:TextStyle(fontSize:16,fontWeight:FontWeight.bold));
    Text t4 = Text("EMI = Rs. ${emi.toStringAsFixed(2)}",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.red));

    Text labelAmount = Text("Loan Amount (Rs. 50,000 - 5,00,000)",style:TextStyle(fontSize:14));
    Text labelTerm = Text("Term (1 - 3 Years)",style:TextStyle(fontSize:14));
    Text labelROI = Text("Rate of Interest (8% - 12%)",style:TextStyle(fontSize:14));

    Column column = Column(mainAxisAlignment:MainAxisAlignment.center,children: [
      labelAmount,sliderTheme1,sizedBox,
      labelTerm,sliderTheme2,sizedBox,
      labelROI,sliderTheme3,sizedBox,
      t1,sizedBox,t2,sizedBox,t3,sizedBox,t4
    ]);

    Padding padding = Padding(padding:EdgeInsets.all(20),child:column);

    Center center = Center(child:padding);

    ElevatedButton btnLogout = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s2");

    } , child:Text("Logout"));

    ElevatedButton btnBack = ElevatedButton(onPressed:(){

      Navigator.pushNamed(context,"/s1");

    } , child:Text("Go to Registration"));

    Row row = Row(mainAxisAlignment:MainAxisAlignment.center,children: [btnBack,SizedBox(width:20),btnLogout]);

    Column mainColumn = Column(mainAxisAlignment:MainAxisAlignment.center,children: [
      Expanded(child:center),row,SizedBox(height:20)
    ]);

    AppBar appBar = AppBar(title:Text("EMI Calculator"),backgroundColor:Colors.lightBlue);

    Scaffold scaffold = Scaffold(appBar:appBar,body:mainColumn,backgroundColor:Colors.green.shade50);

    return scaffold;
  }
}
