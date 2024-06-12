import 'dart:ffi';
import 'dart:ui';


import 'package:flutter/material.dart';

customButton(VoidCallback onTap,String title,{  Color ?color,double? height, double ?width}){
  return InkWell(onTap: onTap ,child: Container(
    height: height??45,
    width: width?? double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color??Colors.green),
    child:
    Center(child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),))));
}