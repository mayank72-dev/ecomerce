import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomapp/src/Model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view/home_screen.dart';


class SignupNotifier extends ChangeNotifier{
  bool showtext = true;
  final formkey = GlobalKey<FormState>();
  TextEditingController  email = TextEditingController();
  TextEditingController  password = TextEditingController();
  TextEditingController  nametext = TextEditingController();
   bool isLoading = false;
   FirebaseAuth auth = FirebaseAuth.instance;
   FirebaseFirestore store = FirebaseFirestore.instance;

  Show(){
    showtext =! showtext;
    print("value${showtext}");
    notifyListeners();
  }

  CheckVelidation(context){
    if(formkey.currentState!.validate()){
      SignUpInwithEmail(context);

    }else{
      print ("error");

    }
    notifyListeners();
  }
  SignUpInwithEmail(context)async{

    try{
      UserCredential result = await  auth.createUserWithEmailAndPassword(email: email.text, password: password.text);
      final User  user = result.user!;
      print("user====${user}");
      if(user.uid!=null){
        SaveUserData(context);
        /*Navigator.push(context, MaterialPageRoute(builder: (context)=>HomScereen()));*/
      }else{
        print("Errorot");
      }
    } on FirebaseAuthException catch(e){
      if(e.code == "weak-password "){
        print("week password");
      } else if(e.code == "email-already-In-use "){
        print("The Account Already exist");
      }

    }
    notifyListeners();
  }


      SaveUserData(context)async{

    UserModel userModel = UserModel(
      name: nametext.text,
      email: email.text,
      userId: auth.currentUser!.uid,
      password: password.text,

    );
 try{
   await store.collection("Users").doc(auth.currentUser!.uid).set(userModel.toJson()).then((Value)=>
       Navigator.push(context, MaterialPageRoute(builder: (context)=>HomScereen())));


 }catch (error){
   print("${error.toString()}");
 }
      }



}