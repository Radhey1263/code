// ============================================================================
// Q10_SCREEN.DART - TABS WITH IMAGES
// ============================================================================
// Uses DefaultTabController to show 2 tabs. Tab 1: Row, Tab 2: Column.
// Uses Icons instead of images to ensure runnability without assets.
// ============================================================================

import 'package:flutter/material.dart';

void main()
{
  runApp(const Q10Screen());
}

class Q10Screen extends StatelessWidget {
  const Q10Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Tab tab1 = Tab(text: "Row Images");
    Tab tab2 = Tab(text: "Column Images");
    TabBar tabBar = TabBar(tabs: [tab1, tab2]);

    AppBar appBar = AppBar(title: Text("Tabs Demo"), bottom: tabBar, backgroundColor: Colors.grey);

    Icon i1 = Icon(Icons.image, size: 50);
    Icon i2 = Icon(Icons.camera, size: 50);
    Icon i3 = Icon(Icons.photo, size: 50);

    Row row = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [i1, i2, i3]);
    Container c1 = Container(color: Colors.lightGreen, alignment: Alignment.center, child: row);

    Column col = Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [i1, i2, i3]);
    Container c2 = Container(color: Colors.orangeAccent, alignment: Alignment.center, child: col);

    TabBarView tabBarView = TabBarView(children: [c1, c2]);

    Scaffold scaffold = Scaffold(appBar: appBar, body: tabBarView);
    DefaultTabController defaultTabController = DefaultTabController(length: 2, child: scaffold);
    MaterialApp materialApp = MaterialApp(home:defaultTabController,debugShowCheckedModeBanner:false);

    return materialApp;
  }
}