// With await

void main() async
{
  String EOTY="Unknown";
  print("Performance Review started...");

  void findEOTY()
  {
    EOTY= "Rajat Desai";
  }

  await Future.delayed(const Duration(seconds:3), findEOTY );  // Future.delayed

  print("Performance Review completed...");

  print("Employee of the Year is ** $EOTY **");

}