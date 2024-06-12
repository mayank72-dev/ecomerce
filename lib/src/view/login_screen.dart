
import 'package:ecomapp/src/view/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../commonWidget/customButton.dart';
import '../Controller/Notifier/login_notifier.dart';


LoginScreen()=>ChangeNotifierProvider(create: (_)=>LoginNotifier(),child: Builder(builder: (context)=>LoginScreenProvider(context:context),),);


class LoginScreenProvider extends StatelessWidget {
  const LoginScreenProvider({Key? key,required BuildContext context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(builder: (context, state, child)=>Scaffold(
      body: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key:  state.formkey,
          child:  Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
            TextFormField(
              validator: (value){
    if(value!.isEmpty){
    return "Enter  Email";

    }else if( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
    return "Enter Valid Email";
    }else{
    return null;
    }

              },
              controller: state.email,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintText: "Email"),),
            Padding(padding: EdgeInsets.only(top: 20),),
            TextFormField(

              obscureText: state.showtext,
              validator: (value){
                if( value!.isEmpty){
                  return "Please Enter PassWord";

                }else if(value.length<8){
                  return "Please Enter Valid PassWord";
                }
              },
              controller: state.password,
              decoration: InputDecoration(
                  suffixIcon:  InkWell(onTap:(){state.Show();} ,
                    child: Icon(state.showtext==true?
                    Icons.visibility_off:Icons.visibility),
                  ),
                  prefixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintText: "password"),),
            Padding(padding: EdgeInsets.only(top: 20),),
            customButton((){state.CheckVelidation(context);},"Login",),
              Padding(padding: EdgeInsets.only(top: 20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont`t have an account ?",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),), Padding(padding: EdgeInsets.only(left: 8),),
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));},
                    child: Text("Sign  Up",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
              )
          ],),
       ] ),
        ),
    )));
  }
}
