// Without await

void main()
{
  String EOTY="Unknown";
  print("Performance Review started...");

  void findEOTY()
  {
    EOTY= "Rajat Desai";
  }

  Future.delayed(const Duration(seconds:3),findEOTY);  // Future.delayed

  print("Performance Review completed...");

  print("Employee of the Year is ** $EOTY **");

}