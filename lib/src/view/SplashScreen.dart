import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
/*
  @override
  void initState() {
    Timer(Duration(seconds: 3),)=>
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    super.initState();

  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: FlutterLogo(size: 40,),),);
  }
}
