import 'dart:math';

import 'package:flutter/material.dart';

class Guess{
   var r= Random();
 int ans=0;
 int count=0;
 Guess(){
   ans = r.nextInt(100)+1;
   print(ans);
 }

 int Dogeuss(int n){
  if(n>ans){
    count++;
    return 1;
    }else if(n<ans){
    count++;
    return -1;
  } else{
    count++;
   return 0;
  }
  }
  int getCount(){
   return count;
  }


 }
