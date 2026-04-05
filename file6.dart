// ============================================================================
// Q6_SCREEN.DART - APPOINTMENT BOOKING
// ============================================================================
// Select Date (today only), dropdown time slots. Book/Reset buttons.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main()
{
  runApp(const Q6Screen());
}

class Q6Screen extends StatefulWidget {
  const Q6Screen({super.key});

  @override
  State<Q6Screen> createState() => _Q6ScreenState();
}

class _Q6ScreenState extends State<Q6Screen> {
  DateTime selectedDate = DateTime.now();
  String selectedSlot = "10 to 11";
  List<String> bookedSlots = [];
  String statusMsg = "";

  @override
  Widget build(BuildContext context) {
    Text title = Text("Book Appointment");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
    Text dateText = Text("Date: $formattedDate");
    IconButton dateBtn = IconButton(onPressed: () { selectDate(); }, icon: Icon(Icons.calendar_month));
    Row dateRow = Row(children: [dateText, dateBtn]);

    DropdownMenuEntry<String> s1 = DropdownMenuEntry(value: "10 to 11", label: "10 to 11");
    DropdownMenuEntry<String> s2 = DropdownMenuEntry(value: "11 to 12", label: "11 to 12");
    DropdownMenuEntry<String> s3 = DropdownMenuEntry(value: "12 to 1", label: "12 to 1");
    DropdownMenuEntry<String> s4 = DropdownMenuEntry(value: "4 to 5", label: "4 to 5");
    DropdownMenuEntry<String> s5 = DropdownMenuEntry(value: "5 to 6", label: "5 to 6");
    DropdownMenuEntry<String> s6 = DropdownMenuEntry(value: "6 to 7", label: "6 to 7");
    DropdownMenu dropdown = DropdownMenu(dropdownMenuEntries: [s1, s2, s3, s4, s5, s6], initialSelection: "10 to 11", onSelected: (val) {
      setState(() { selectedSlot = val.toString(); });
    });

    Text bookTxt = Text("Book");
    ElevatedButton bookBtn = ElevatedButton(onPressed: () {
      setState(() {
        String entry = "$formattedDate - $selectedSlot";
        if (bookedSlots.contains(entry)) {
          statusMsg = "Slot not available";
        } else {
          bookedSlots.add(entry);
          statusMsg = "Slot booked successfully";
        }
      });
    }, child: bookTxt);

    Text resetTxt = Text("Reset");
    ElevatedButton resetBtn = ElevatedButton(onPressed: () {
      setState(() { bookedSlots.clear(); statusMsg = ""; });
    }, child: resetTxt);

    Row btnRow = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [bookBtn, resetBtn]);

    Badge totalBadge = Badge.count(count: bookedSlots.length, child: Icon(Icons.bookmark, size: 40));

    ListView listView = ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: bookedSlots.length,
      itemBuilder: (context, index) { return ListTile(title: Text(bookedSlots[index])); }
    );

    Text statusText = Text(statusMsg, style: TextStyle(color: Colors.red, fontSize: 16));

    SizedBox space = SizedBox(height: 20);
    Column col = Column(children: [dateRow, dropdown, space, btnRow, space, totalBadge, space, listView, statusText]);

    SingleChildScrollView scrollView = SingleChildScrollView(child: col);
    Container container = Container(alignment: Alignment.center, child: scrollView);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }

  Future selectDate() async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(context: context, initialDate: now, firstDate: now, lastDate: now);
    if (picked != null) setState(() { selectedDate = picked; });
  }
}