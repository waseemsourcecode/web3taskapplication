import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_dimens.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_images.dart';
import 'package:web3shopping_app/clean_architech/core/global_functions.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_product.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/products/state_product.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/routers/app_navigations.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/routers/app_screens.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/screens/dashboard/detail_screen.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/app_elevated_button.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/custom_label.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/widget_net_image.dart';

import '../../../../cubits/products/cubit_product.dart';

class TabHome extends StatelessWidget{
  const TabHome({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<CubitProduct, StateProduct>(builder: (context, state) {
      onConsole("STATE IS **** $state");
      if(state is StateProductInitial){
BlocProvider.of<CubitProduct>(context).loadAllProducts();
      }
      else  if(state is StateProductFailed){
  return   Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         
                          const CustomLabel(
                              text: "Failed to reload",
                              type: TextStyleType.f14_600)
                       ,
                       TextButton(onPressed: (){
    BlocProvider.of<CubitProduct>(context).loadAllProducts();
                       }, child: const Text("Reload"))
                        ],
                      ),
  );
      }
else if(state is StateProductLoading){
  return const Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          CustomLabel(
                              text: "Please wait...",
                              type: TextStyleType.f12_400Type2)
                        ],
                      ),
  );
}
else if(state is StateProductLoaded){
return     Column(children: [
      homeTopView(),
      dimenVertical(40),
      homeHighLightView(),
          dimenVertical(30),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, i) {
                return      ProductView(product:  state.product[i]);
               },
            ),
          )
       
      
    ],);


}
 return const Center(
   child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          CustomLabel(
                              text: "Please wait...",
                              type: TextStyleType.f12_400Type2)
                        ],
                      ),
 );
      }
        );
    
     
    
    
    
 
  }

  Padding homeHighLightView() {
    return const Padding(
      padding: EdgeInsets.only(left:10.0,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        CustomLabel(text: "LIMITED", type: TextStyleType.f22_600),
         CustomLabel(text: "RECOMMEND",forceColor: Colors.grey, type: TextStyleType.f22_600),
          CustomLabel(text: "NEW IN", forceColor: Colors.grey, type: TextStyleType.f22_600),
      
      ],),
    );
  }

  Padding homeTopView() {
    return const Padding(
      padding: EdgeInsets.only(left:30.0,right: 30,top: 20),
      child: Row(children: [
        Icon(Icons.fast_forward)
      ,
      CustomLabel(text: "W3Shopping", type: TextStyleType.f16_600),
      Spacer(),
      Icon(Icons.search),
      Icon(Icons.shop)
      ],),
    );
  }
  
}

class ProductView extends StatelessWidget {
  const ProductView( {
    super.key,
    required this.product
  });
final ModelProduct product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8,top: 20),
      child: Row(children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(75.0),
          
          child: WidgetNetworkImage(link: product.image, size: const Size(150, 150))
          
          // Image.asset(AppImages.logo,height: 150,width: 150,
          // fit: BoxFit.fitWidth,
         // ),
        ),
        const SizedBox(width: 5,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CustomLabel(text: product.description, type: TextStyleType.f12_600,maxLine: 1,),
          CustomLabel(text: product.title, type: TextStyleType.f22_600,overFlow: TextOverflow.clip,maxLine: 1,),
          CustomLabel(text: product.price.toString(), forceColor: Colors.orange, type: TextStyleType.f18_600),
          SizedBox(
            height: 50,
            width: 150,
            child: AppElevatedButton(onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(data: product,)));
            
            },borderRadius: BorderRadius.circular(20), child: const Text("TAKE A LOOK")))
        ],),
      )
      
      ],),
    );
  }
}