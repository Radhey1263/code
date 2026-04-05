// ============================================================================
// Q7_SCREEN.DART - FOOD SHOP SALES
// ============================================================================
// Stock tracking for Breakfast, Lunch, Dinner. Updates quantities dynamically.
// ============================================================================

import 'package:flutter/material.dart';

void main()
{
  runApp(const Q7Screen());
}

class Q7Screen extends StatefulWidget {
  const Q7Screen({super.key});

  @override
  State<Q7Screen> createState() => _Q7ScreenState();
}

class _Q7ScreenState extends State<Q7Screen> {
  int bStock = 30; int lStock = 40; int dStock = 30;
  int bSold = 0; int lSold = 0; int dSold = 0;
  int bPrice = 40; int lPrice = 80; int dPrice = 60;
  int bQty = 1; int lQty = 1; int dQty = 1;
  
  int targetSale = 10000;

  @override
  Widget build(BuildContext context) {
    Text title = Text("Food Sales Tracker");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    int totalEarned = (bSold * bPrice) + (lSold * lPrice) + (dSold * dPrice);
    int remainingSale = targetSale - totalEarned;

    Row bRow = buildItemRow("Breakfast", bStock, bSold, bPrice, bQty, (val) { setState(() { bQty = val!; }); }, () { setState(() { bStock -= bQty; bSold += bQty; bQty = 1; }); });
    Row lRow = buildItemRow("Lunch", lStock, lSold, lPrice, lQty, (val) { setState(() { lQty = val!; }); }, () { setState(() { lStock -= lQty; lSold += lQty; lQty = 1; }); });
    Row dRow = buildItemRow("Dinner", dStock, dSold, dPrice, dQty, (val) { setState(() { dQty = val!; }); }, () { setState(() { dStock -= dQty; dSold += dQty; dQty = 1; }); });

    Text targetTxt = Text("Total Target Sale: Rs. $targetSale", style: TextStyle(fontWeight: FontWeight.bold));
    Text achievedTxt = Text("Total Sale Achieved: Rs. $totalEarned", style: TextStyle(fontWeight: FontWeight.bold));
    Text remainingTxt = Text("Total Sale Remaining: Rs. $remainingSale", style: TextStyle(fontWeight: FontWeight.bold));

    SizedBox space = SizedBox(height: 20);
    Column col = Column(children: [bRow, space, lRow, space, dRow, space, targetTxt, space, achievedTxt, space, remainingTxt]);

    SingleChildScrollView scroll = SingleChildScrollView(child: col);
    Container container = Container(alignment: Alignment.center, child: scroll);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }

  Row buildItemRow(String name, int stock, int sold, int price, int qty, Function(int?) onDropdownChanged, VoidCallback onPlaceOrder) {
    Text nameTxt = Text(name, style: TextStyle(fontSize: 16));
    Text soldTxt = Text("Sold: $sold");
    
    List<DropdownMenuItem<int>> items = [];
    for (int i = 1; i <= 5 && i <= stock; i++) {
      items.add(DropdownMenuItem(value: i, child: Text("$i")));
    }
    if (items.isEmpty) items.add(DropdownMenuItem(value: 0, child: Text("0")));
    
    DropdownButton<int> drop = DropdownButton<int>(value: stock == 0 ? 0 : qty, items: items, onChanged: stock == 0 ? null : onDropdownChanged);
    
    int total = stock == 0 ? 0 : qty * price;
    Text priceTxt = Text("Rs. $total");
    
    ElevatedButton btn = ElevatedButton(onPressed: stock == 0 ? null : onPlaceOrder, child: Text("Order"));
    Badge badge = Badge.count(count: stock, child: Icon(Icons.inventory));
    
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [nameTxt, soldTxt, drop, priceTxt, btn, badge]);
  }
}