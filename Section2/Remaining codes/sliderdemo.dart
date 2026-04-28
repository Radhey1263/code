import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  double v=5;
  @override
  Widget build(BuildContext context)
  {

    SliderThemeData sliderThemeData = SliderThemeData(showValueIndicator:ShowValueIndicator.alwaysVisible
    );

    Slider slider = Slider(label:"$v",min:1,max:11, divisions:10,value: v, onChanged: (value){

      setState(() {

         v=value;

      });

    });

   SliderTheme sliderTheme = SliderTheme(data: sliderThemeData, child: slider);


    // RotatedBox rotatedBox =RotatedBox(quarterTurns: -1,child:slider);

   // SliderTheme sliderTheme = SliderTheme(data: sliderThemeData, child: rotatedBox);

    Text sliderValue = Text("Current value = $v");

    Row row = Row(mainAxisSize: MainAxisSize.max,children: [sliderTheme,sliderValue],);

    Center center = Center(child:row);
    AppBar appBar = AppBar(title: const Text("Slider Demo"),backgroundColor:Colors.limeAccent ,);
    Scaffold s = Scaffold(appBar:appBar,body:center);
    MaterialApp m = MaterialApp(home:s,debugShowCheckedModeBanner: false,);
    return m;

  }
}
