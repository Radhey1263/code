// ============================================================================
// Q2_SCREEN.DART - FIND MAXIMUM
// ============================================================================
// Creates three scrollbars (sliders) for variables a, b, c (1 to 5).
// "Show Max" button displays maximum of a, b, and c.
// ============================================================================

import 'package:flutter/material.dart';

void main()
{
  runApp(const Q2Screen());
}

class Q2Screen extends StatefulWidget {
  const Q2Screen({super.key});

  @override
  State<Q2Screen> createState() => _Q2ScreenState();
}

class _Q2ScreenState extends State<Q2Screen> {
  double a = 1;
  double b = 1;
  double c = 1;
  String maxText = "";

  @override
  Widget build(BuildContext context) {
    Text title = Text("Find Maximum");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    Slider sliderA = Slider(min: 1, max: 5, divisions: 4, value: a, onChanged: (value) { setState(() { a = value; }); });
    Text textA = Text("a = $a");
    Column colA = Column(children: [sliderA, textA]);

    Slider sliderB = Slider(min: 1, max: 5, divisions: 4, value: b, onChanged: (value) { setState(() { b = value; }); });
    Text textB = Text("b = $b");
    Column colB = Column(children: [sliderB, textB]);

    Slider sliderC = Slider(min: 1, max: 5, divisions: 4, value: c, onChanged: (value) { setState(() { c = value; }); });
    Text textC = Text("c = $c");
    Column colC = Column(children: [sliderC, textC]);

    Text btnText = Text("Show Max");
    ElevatedButton btn = ElevatedButton(onPressed: () {
      setState(() {
        double max = a;
        if (b > max) max = b;
        if (c > max) max = c;
        maxText = "Maximum is $max";
      });
    }, child: btnText);

    Text outText = Text(maxText, style: TextStyle(fontSize: 20));

    SizedBox space = SizedBox(height: 30);
    Column mainCol = Column(mainAxisAlignment: MainAxisAlignment.center, children: [colA, space, colB, space, colC, space, btn, space, outText]);

    Container container = Container(alignment: Alignment.center, child: mainCol);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }
}