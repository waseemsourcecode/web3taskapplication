import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_dimens.dart';
import 'package:web3shopping_app/clean_architech/core/global_functions.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_product.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/app_elevated_button.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/custom_label.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/widget_net_image.dart';
 
import '../authorizatin/login/login_screen.dart';

class DetailScreen extends StatelessWidget {
  

  const DetailScreen({super.key, required this.data});


  final ModelProduct data;
 


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    
    body: SafeArea(child: CustomPaint(
        painter: ContainerPatternPainter(),
      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          topRow(context),
          dimenVertical(30),
        WidgetNetworkImage(link: data.image, size: Size(double.infinity, 300),fitType: BoxFit.scaleDown,),
          dimenVertical(10),
          CustomLabel(text: data.description, type: TextStyleType.f17_600),
 dimenVertical(10),
          Padding(
           padding: const EdgeInsets.only(left:50.0,right: 50),
            child: AppElevatedButton(onPressed: (){
              toast("Item Purchased Successfully.");
              Navigator.pop(context);
            },borderRadius: BorderRadius.circular(30), child: CustomLabel(text: "Make it yours at "+ data.price.toString(),forceColor: Colors.white,  type: TextStyleType.f14_600)))
        ],),
      ))),
   );
  }

  Padding topRow(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left:30.0,right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [IconButton(onPressed: (){
          Navigator.pop(context);
         }, icon: Icon(Icons.arrow_back)),
         
         Expanded(child: CustomLabel(forceAlignment: TextAlign.center, text: data.title, type: TextStyleType.f18_600)),
         Icon(Icons.shop)
         ], 
         ),
      );
  }
  
}