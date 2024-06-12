
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../view/home_screen.dart';



class LoginNotifier extends ChangeNotifier{
  bool showtext = true;
  final formkey = GlobalKey<FormState>();
  TextEditingController  email = TextEditingController();
  TextEditingController  password = TextEditingController();
 final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  Show(){
    showtext =! showtext;
    print("value${showtext}");
    notifyListeners();
  }

  CheckVelidation(context){
    if(formkey.currentState!.validate()){
      SignInwithEmail(context);
    }else{
      print("invalid Error");

    }
notifyListeners();


  }

  SignInwithEmail(context)async{
    isLoading = true;
    notifyListeners();
  try{
    UserCredential result = await  auth.signInWithEmailAndPassword(email: email.text, password: password.text);
     final User  user = result.user!;
  if(user.uid!=null){
    isLoading = false;
    notifyListeners();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomScereen()));
  }
  } on FirebaseAuthException catch(e){
    if(e.code == "user- not -found"){
      print("No user Found ");
    } else if(e.code == "Wrong password"){
       print("Wrong Password");
    }

  }
  }
}