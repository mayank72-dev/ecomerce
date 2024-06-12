
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../commonWidget/customButton.dart';

import '../Controller/Notifier/SignUpNotifier.dart';
import 'login_screen.dart';

SignUpScreen()=>ChangeNotifierProvider(create: (_)=>SignupNotifier(),child: Builder(builder: (context)=>SignupScreenProvider(context:context),),);
class SignupScreenProvider extends StatelessWidget {
  const SignupScreenProvider({Key? key,required BuildContext context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupNotifier>(builder: (context,state, child)=>Scaffold(
         body: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key:  state.formkey,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextFormField(
            validator: (value){
              if(value! .isEmpty){
                return "please required";
              }else{
                return null;
              }
            },
            controller: state.nametext,
            decoration: InputDecoration(prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintText: "Email"),),
          Padding(padding: EdgeInsets.only(top: 10),),
          TextFormField(
            validator: (value){
              if(value!.isEmpty){
                return "Enter  Email";

              }else if( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                return "Please Enter Valid email";
              }else{
                return null;
              }
            },
            controller: state.email,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintText: "Email"),),
          Padding(padding: EdgeInsets.only(top: 10),),
          TextFormField(
            validator: (value){
              if( value!.isEmpty){
                return "Please Enter PassWord";

              }else if(value.length<8){
                return "Please Enter Valid PassWord";
              }
            },
            controller: state.password,
            obscureText: state.showtext, decoration: InputDecoration(


              suffixIcon:  InkWell(onTap:(){state.Show();} ,
                child: Icon(state.showtext==true?
                    Icons.visibility_off:Icons.visibility),
              ),

                prefixIcon: Icon(Icons.key),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintText: "Email"),),
          Padding(padding: EdgeInsets.only(top: 10),),
          customButton((){state.CheckVelidation(context);},"Sign Up"),
            Padding(padding: EdgeInsets.only(top: 10),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You  have an account ?",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),), Padding(padding: EdgeInsets.only(left: 8),),
                InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));},
                  child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                )
              ],),
        ],),
      ),
    ),

    ));
  }
}
