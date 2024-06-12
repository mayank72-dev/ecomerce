
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/Notifier/home_notifier.dart';


HomScereen()=>ChangeNotifierProvider(create: (_)=>HomeNotifier(),child: Builder(builder: (context)=>HomeScreenProvider(context:context),),);
class HomeScreenProvider extends StatelessWidget {
   HomeScreenProvider({Key? key,required BuildContext context}) : super(key: key){
     WidgetsBinding.instance.addPostFrameCallback((timpeStemp){
       var state = Provider.of<HomeNotifier>(context, listen: false);
       state.initState();

     });
}
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, state, child)=>SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Future",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                InkWell(
                    onTap: (){},
                    child: Text("View all",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            SizedBox(height: 500,
              child: ListView.builder(
                itemCount: state.futureList.length,
                scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height:150,
                        width: 100,

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),
                        child: Image.network(state.futureList[index].productImages!.first,fit: BoxFit.cover,),
                      ),
                      Text(state.futureList[index].productName!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      Text(state.futureList[index].productPrice!.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                    ],
                  ),
                );
              }),
            )
          ],
        ),

        ),

      ),
    ));
  }
}
