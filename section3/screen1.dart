import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController firstCtrl = TextEditingController();
  TextEditingController lastCtrl = TextEditingController();
  
  String gender = "Male";
  bool eng = true;
  bool guj = false;
  bool hin = false;
  String output = "";

  @override
  Widget build(BuildContext context) {
    Text title = Text("Registration Form");
    AppBar appBar = AppBar(title: title, backgroundColor: Colors.lightBlue);

    OutlineInputBorder border = OutlineInputBorder();
    TextField firstTF = TextField(controller: firstCtrl, decoration: InputDecoration(border: border, labelText: "Firstname"));
    TextField lastTF = TextField(controller: lastCtrl, decoration: InputDecoration(border: border, labelText: "Lastname"));

    Text genTxt = Text("Gender:");
    RadioListTile r1 = RadioListTile(title: Text("Male"), value: "Male", groupValue: gender, onChanged: (val) { setState(() { gender = val.toString(); }); });
    RadioListTile r2 = RadioListTile(title: Text("Female"), value: "Female", groupValue: gender, onChanged: (val) { setState(() { gender = val.toString(); }); });
    RadioListTile r3 = RadioListTile(title: Text("Other"), value: "Other", groupValue: gender, onChanged: (val) { setState(() { gender = val.toString(); }); });

    Text langTxt = Text("Languages known:");
    CheckboxListTile c1 = CheckboxListTile(title: Text("English"), value: eng, onChanged: (val) { setState(() { eng = val!; }); });
    CheckboxListTile c2 = CheckboxListTile(title: Text("Gujarati"), value: guj, onChanged: (val) { setState(() { guj = val!; }); });
    CheckboxListTile c3 = CheckboxListTile(title: Text("Hindi"), value: hin, onChanged: (val) { setState(() { hin = val!; }); });

    ElevatedButton btn = ElevatedButton(onPressed: () {
      setState(() {
        String langs = "";
        if (eng) langs += "English ";
        if (guj) langs += "Gujarati ";
        if (hin) langs += "Hindi ";
        output = "Name: ${firstCtrl.text} ${lastCtrl.text}\nGender: $gender\nLangs: $langs";
      });
      Navigator.pushNamed(context, '/s2');
    }, child: Text("Register"));

    Text outTxt = Text(output);
    SizedBox space = SizedBox(height: 10);
    
    Column col = Column(children: [firstTF, space, lastTF, space, genTxt, r1, r2, r3, space, langTxt, c1, c2, c3, space, btn, space, outTxt]);
    
    SingleChildScrollView scroll = SingleChildScrollView(child: col);
    Container container = Container(alignment: Alignment.center, child: scroll);
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    
    return scaffold;
  }
}
