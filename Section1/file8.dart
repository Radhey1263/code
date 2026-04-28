// ============================================================================
// Q8_SCREEN.DART - SEAT BOOKING
// ============================================================================
// Select and book seats. Tracks booked, available, and earning.
// ============================================================================

import 'package:flutter/material.dart';

void main()
{
  runApp(const Q8Screen());
}

class Q8Screen extends StatefulWidget {
  const Q8Screen({super.key});

  @override
  State<Q8Screen> createState() => _Q8ScreenState();
}

class _Q8ScreenState extends State<Q8Screen> {
  List<String> seats = ["A1", "A2", "A3", "A4", "A5", "B1", "B2", "B3", "B4", "B5", "C1", "C2", "C3", "C4", "C5"];
  List<String> bookedSeats = [];
  String selectedSeat = "";

  @override
  Widget build(BuildContext context) {
    Text title = Text("Seat Booking");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    Wrap wrap = Wrap(
      spacing: 10, runSpacing: 10, alignment: WrapAlignment.center,
      children: seats.map((seat) {
        Color bgColor = Colors.white;
        if (bookedSeats.contains(seat) && selectedSeat == seat) bgColor = Colors.yellow;
        else if (bookedSeats.contains(seat)) bgColor = Colors.red;
        else if (selectedSeat == seat) bgColor = Colors.grey;

        ElevatedButton btn = ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: bgColor),
          onPressed: () { setState(() { selectedSeat = seat; }); },
          child: Text(seat, style: TextStyle(color: Colors.black))
        );
        return btn;
      }).toList(),
    );

    ElevatedButton bookBtn = ElevatedButton(onPressed: () {
      setState(() {
        if (selectedSeat.isNotEmpty && !bookedSeats.contains(selectedSeat)) {
          bookedSeats.add(selectedSeat);
          selectedSeat = "";
        }
      });
    }, child: Text("Book"));

    ElevatedButton releaseBtn = ElevatedButton(onPressed: () {
      setState(() {
        if (selectedSeat.isNotEmpty && bookedSeats.contains(selectedSeat)) {
          bookedSeats.remove(selectedSeat);
          selectedSeat = "";
        }
      });
    }, child: Text("Release"));

    Row btnRow = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [bookBtn, releaseBtn]);

    int bookedCount = bookedSeats.length;
    int availCount = 15 - bookedCount;
    int earnings = 0;
    for (String s in bookedSeats) {
      if (s.startsWith("A")) earnings += 800;
      if (s.startsWith("B")) earnings += 600;
      if (s.startsWith("C")) earnings += 500;
    }

    Text bookedTxt = Text("Total booked: $bookedCount", style: TextStyle(fontSize: 16));
    Text availTxt = Text("Total available: $availCount", style: TextStyle(fontSize: 16));
    Text earnTxt = Text("Total Earning: Rs. $earnings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold));

    SizedBox space = SizedBox(height: 20);
    Column col = Column(children: [space, wrap, space, btnRow, space, bookedTxt, space, availTxt, space, earnTxt]);

    SingleChildScrollView scrollView = SingleChildScrollView(child: col);
    Container container = Container(alignment: Alignment.center, child: scrollView);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;
  }
}