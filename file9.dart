// ============================================================================
// Q9_SCREEN.DART - FOOD ORDER
// ============================================================================
// Select All checkbox toggles others. Calculates total price.
// ============================================================================

import 'package:flutter/material.dart';

void main()
{
  runApp(const Q9Screen());
}

class Q9Screen extends StatefulWidget {
  const Q9Screen({super.key});

  @override
  State<Q9Screen> createState() => _Q9ScreenState();
}

class _Q9ScreenState extends State<Q9Screen> {
  bool selectAll = false;
  bool pizza = false;
  bool fries = false;
  bool drink = false;

  @override
  Widget build(BuildContext context) {
    Text title = Text("Food Order");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    CheckboxListTile allCb = CheckboxListTile(title: Text("Select All"), value: selectAll, onChanged: (val) {
      setState(() {
        selectAll = val!;
        pizza = selectAll; fries = selectAll; drink = selectAll;
      });
    });

    CheckboxListTile pCb = CheckboxListTile(title: Text("Pizza (Rs. 250)"), value: pizza, onChanged: (val) { setState(() { pizza = val!; updateAllState(); }); });
    CheckboxListTile fCb = CheckboxListTile(title: Text("French Fries (Rs. 80)"), value: fries, onChanged: (val) { setState(() { fries = val!; updateAllState(); }); });
    CheckboxListTile dCb = CheckboxListTile(title: Text("Colddrink (Rs. 50)"), value: drink, onChanged: (val) { setState(() { drink = val!; updateAllState(); }); });

    int total = 0;
    String items = "";
    if (pizza) { total += 250; items += "Pizza, "; }
    if (fries) { total += 80; items += "French Fries, "; }
    if (drink) { total += 50; items += "Colddrink, "; }

    Text itemsTxt = Text("Selected: $items", style: TextStyle(fontSize: 16));
    Text priceTxt = Text("Total Price: Rs. $total", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));

    SizedBox space = SizedBox(height: 20);
    Column col = Column(children: [allCb, pCb, fCb, dCb, space, itemsTxt, space, priceTxt]);

    Container container = Container(alignment: Alignment.center, child: col);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }

  void updateAllState() {
    if (pizza && fries && drink) selectAll = true;
    else selectAll = false;
  }
}