import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  String selectedState="";
  String selectedCity="";
  String city1="",city2="",city3="";

  @override
  Widget build(BuildContext context)
  {
    // DropdownMenuEntry - One each for the option

    DropdownMenuEntry<String> option1 = DropdownMenuEntry(value: "Gujarat", label: "Gujarat");
    DropdownMenuEntry<String> option2 = DropdownMenuEntry(value: "Maharashtra", label: "Maharashtra");
    DropdownMenuEntry<String> option3 = DropdownMenuEntry(value: "Rajasthan", label: "Rajasthan");

    List<DropdownMenuEntry<String>> list1 =  [option1,option2,option3];

    DropdownMenu dropdownMenu1 = DropdownMenu(dropdownMenuEntries:list1,hintText:"Select state",initialSelection:"Gujarat",
    onSelected:(value){

      setState(() {
        selectedState = value as String;
        debugPrint("You have selected $selectedState");

        if(selectedState=="Gujarat")
          {
            city1="Ahemdabad";
            city2="Vadodara";
            city3="Surat";
          }
        else  if(selectedState=="Maharashtra")
        {
          city1="Mumbai";
          city2="Pune";
          city3="Nagpur";
        }
        else
        {
          city1="Jaipur";
          city2="Udaipur";
          city3="Jesalmer";
        }




      });
          } ,);



    DropdownMenuEntry<String> option4 = DropdownMenuEntry(value: city1, label: city1);
    DropdownMenuEntry<String> option5 = DropdownMenuEntry(value: city2, label: city2);
    DropdownMenuEntry<String> option6 = DropdownMenuEntry(value: city3, label: city3);

    List<DropdownMenuEntry<String>> list2 =  [option4,option5,option6];

    DropdownMenu dropdownMenu2 = DropdownMenu(dropdownMenuEntries:list2,hintText:"Select city",onSelected:(value){

      setState(() {
        selectedCity = value as String;
        value="";
        debugPrint("You have selected $selectedState and $selectedCity");
      });

    });

    SizedBox sizedBox = SizedBox(height:40);

    Column column = Column(mainAxisAlignment:MainAxisAlignment.center,children: [dropdownMenu1,sizedBox,dropdownMenu2],);

    Container container = Container(alignment:Alignment.center, child:column);


    AppBar appBar = AppBar(title:Text("Linked DropdownMenu widgets"),backgroundColor: Colors.lightBlue,);

    Scaffold scaffold = Scaffold(appBar:appBar,body:container);

    MaterialApp materialApp = MaterialApp(home:scaffold,debugShowCheckedModeBanner:false);

    return materialApp;

  }
}
