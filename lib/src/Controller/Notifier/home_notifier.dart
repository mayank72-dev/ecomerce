import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomapp/src/Model/product.dart';
import 'package:flutter/cupertino.dart';

class HomeNotifier extends ChangeNotifier{
  List<ProductModel> futureList =[];
FirebaseFirestore firestore = FirebaseFirestore.instance;
 Future getFutureProducts()async{
    ProductModel productModel;
    List<ProductModel> newList =[];
QuerySnapshot data=    await firestore.collection("Products").get();
 for(var element in data.docs){
   if(element.exists){
     productModel = ProductModel.fromJson(element.data());
     newList.add(productModel);
     notifyListeners();

   }
   futureList = newList;
   notifyListeners();
   return futureList;
 }

  }

  initState(){
   getFutureProducts();
  }

}