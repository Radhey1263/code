// ============================================================================
// Q13_SCREEN.DART - EMI CALCULATOR
// ============================================================================
// Uses sliders to calculate EMI based on Amount, Term, and ROI.
// ============================================================================

import 'package:flutter/material.dart';

void main()
{
  runApp(const Q13Screen());
}

class Q13Screen extends StatefulWidget {
  const Q13Screen({super.key});

  @override
  State<Q13Screen> createState() => _Q13ScreenState();
}

class _Q13ScreenState extends State<Q13Screen> {
  double amount = 50000;
  double term = 1;
  double roi = 8;
  double emi = 0;

  @override
  Widget build(BuildContext context) {
    Text title = Text("EMI Calculator");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    Slider s1 = Slider(min: 50000, max: 500000, divisions: 9, value: amount, onChanged: (val) { setState(() { amount = val; }); });
    Slider s2 = Slider(min: 1, max: 3, divisions: 2, value: term, onChanged: (val) { setState(() { term = val; }); });
    Slider s3 = Slider(min: 8, max: 12, divisions: 4, value: roi, onChanged: (val) { setState(() { roi = val; }); });

    Text t1 = Text("Amount = Rs. $amount");
    Text t2 = Text("Term = $term Year(s)");
    Text t3 = Text("ROI = $roi %");

    emi = (amount + ((amount * roi * term) / 100)) / (term * 12);
    Text t4 = Text("EMI = Rs. ${emi.toStringAsFixed(2)}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));

    SizedBox space = SizedBox(height: 20);
    Column col = Column(mainAxisAlignment: MainAxisAlignment.center, children: [s1, t1, space, s2, t2, space, s3, t3, space, t4]);

    Container container = Container(alignment: Alignment.center, child: col);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }
}