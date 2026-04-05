// ============================================================================
// Q14_SCREEN.DART - STATE-CITY SELECTION
// ============================================================================
// Dropdown for State. Radio buttons for Cities based on selected state.
// ============================================================================

import 'package:flutter/material.dart';

void main()
{
  runApp(const Q14Screen());
}

class Q14Screen extends StatefulWidget {
  const Q14Screen({super.key});

  @override
  State<Q14Screen> createState() => _Q14ScreenState();
}

class _Q14ScreenState extends State<Q14Screen> {
  String selectedState = "Gujarat";
  String selectedCity = "";

  List<String> getCities(String state) {
    if (state == "Gujarat") return ["Ahmedabad", "Vadodara", "Surat"];
    if (state == "Maharashtra") return ["Mumbai", "Pune", "Nagpur"];
    return ["Jaipur", "Udaipur", "Jaisalmer"];
  }

  @override
  Widget build(BuildContext context) {
    Text title = Text("State City Selection");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    DropdownMenuEntry<String> o1 = DropdownMenuEntry(value: "Gujarat", label: "Gujarat");
    DropdownMenuEntry<String> o2 = DropdownMenuEntry(value: "Maharashtra", label: "Maharashtra");
    DropdownMenuEntry<String> o3 = DropdownMenuEntry(value: "Rajasthan", label: "Rajasthan");
    
    DropdownMenu drop = DropdownMenu(dropdownMenuEntries: [o1, o2, o3], initialSelection: "Gujarat", onSelected: (val) {
      setState(() { selectedState = val.toString(); selectedCity = ""; });
    });

    List<String> cities = getCities(selectedState);

    RadioListTile r1 = RadioListTile(title: Text(cities[0]), value: cities[0], groupValue: selectedCity, onChanged: (val) { setState(() { selectedCity = val.toString(); }); });
    RadioListTile r2 = RadioListTile(title: Text(cities[1]), value: cities[1], groupValue: selectedCity, onChanged: (val) { setState(() { selectedCity = val.toString(); }); });
    RadioListTile r3 = RadioListTile(title: Text(cities[2]), value: cities[2], groupValue: selectedCity, onChanged: (val) { setState(() { selectedCity = val.toString(); }); });

    Text outTxt = Text("Selected: $selectedState, $selectedCity", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold));

    SizedBox space = SizedBox(height: 20);
    Column col = Column(children: [space, drop, space, r1, r2, r3, space, outTxt]);

    Container container = Container(alignment: Alignment.center, child: col);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }
}