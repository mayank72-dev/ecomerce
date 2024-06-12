import 'package:flutter/material.dart';
Emailvlidation( String value){
  if(value!.isEmpty){
    return "Enter  Email";

  }else if( RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
    return "Enter Valid Email";
  }else{
    return null;
  }
}

PassWordValidaton(String value){
  if( value.isEmpty){
    return "Please Enter PassWord";

  }else if(value.length<8){
    return "Please Enter Valid PassWord";
  }
}

Emptyvalidation(String value){
   if(value .isEmpty){
     return "please required";
  }else{
   return null;
   }
}