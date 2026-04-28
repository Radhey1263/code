// Creating variables using dynamic

void main() 
{
  // Same variable is assigneddifferent TYPE of values....
  
  dynamic v = 21;
  print(" v = $v"); 
  print("\n Datatype of v is ${v.runtimeType}");
  
  v = 15.99;
  print(" v = $v"); 
  print("\nNow, datatype of v is ${v.runtimeType}");
  
  
  v = true;
  print(" v = $v"); 
  print("\nFinally, datatype of v is ${v.runtimeType}");
  
}
