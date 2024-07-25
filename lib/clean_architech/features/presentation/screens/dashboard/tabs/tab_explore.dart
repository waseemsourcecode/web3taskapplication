import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_dimens.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_images.dart';
import 'package:web3shopping_app/clean_architech/core/global_functions.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/products/cubit_product.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/app_elevated_button.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/custom_label.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/widget_loading.dart';

import '../../../cubits/products/state_product.dart';
import '../Tabs/tab_home/tab_home.dart';
import '../detail_screen.dart';

class TabExplore extends StatelessWidget{
  const TabExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Center(child: CustomLabel(text: "Explore All Products", forceColor: Colors.black, type: TextStyleType.f22_600,),),
          dimenVertical(30),

       BlocBuilder<CubitProduct, StateProduct>(builder: (context, state) {
      onConsole("STATE IS **** $state");
      if(state is StateProductInitial){
BlocProvider.of<CubitProduct>(context).loadAllProducts();
      }
      else  if(state is StateProductFailed){
  return   WidgetFailed(callback: (){
       BlocProvider.of<CubitProduct>(context).loadAllProducts();
  });
      }
else if(state is StateProductLoading){
  return const WidgetLoading();
}
else if(state is StateProductLoaded){
return     Expanded(
  child: ListView.builder(
    shrinkWrap: true,
    itemCount: state.product.length,
    itemBuilder: (context, i) {
      return      ProductView(product:  state.product[i]);
     },
  ),
);


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
        )
    
     
       
      
    ],);

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

class WidgetFailed extends StatelessWidget {
  const WidgetFailed({
    super.key,
    required this.callback
  });
final Function callback;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           
                            const CustomLabel(
                                text: "Failed to reload",
                                type: TextStyleType.f14_600)
                         ,
                         TextButton(onPressed: (){
   callback();
                         }, child: const Text("Reload"))
                          ],
                        ),
    );
  }
}


 