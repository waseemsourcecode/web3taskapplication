import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patterns_canvas/patterns_canvas.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_dimens.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_images.dart';
import 'package:web3shopping_app/clean_architech/core/global_functions.dart';
import 'package:web3shopping_app/clean_architech/core/utils/screen_lifecycle.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/login/cubit_login.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/login/state_login.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/profile/cubit_profile.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/profile/state_profile.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/routers/app_navigations.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/routers/app_screens.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/app_elevated_button.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/custom_label.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../widgets/custom_field.dart';
import '../../../widgets/widget_loading.dart';
import '../../authorizatin/login/login_screen.dart';
import 'tab_explore.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateLoginScreen();
  }
}

class _StateLoginScreen extends State<TabProfile> {
  //Variables

  bool processing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: ContainerPatternPainter(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CustomLabel(text: "Profile", type: TextStyleType.f22_600),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        AppImages.logo,
                        height: 300,
                        width: 300,
                      )),
                  dimenVertical(),
                  Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: 
                             BlocBuilder<CubitProfile, StateProfile>(builder: (context, state) {
      onConsole("STATE IS **** $state");
      if(state is StateProfileInitial){
BlocProvider.of<CubitProfile>(context).getProfile();
}
if(state is StateProfileLoading){
return WidgetLoading();
}
if(state is StateProfileLoaded){
  return  Column(
                          children: [
                            rowName("Name", state.user.userName),
                            dimenVertical(20),
                            rowName("Email", state.user.email),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 30, left: 50, right: 50),
                                child: AppElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<CubitProfile>(context).logout();
                                    },
                                    borderRadius: BorderRadius.circular(30),
                                    child: CustomLabel(
                                        text: "Logout?",
                                        forceColor: Colors.white,
                                        type: TextStyleType.f18_600)))
                          ],
                        );
}
if(state is StateProfileFailed){
   return   WidgetFailed(callback: (){
       BlocProvider.of<CubitProfile>(context).getProfile();
  });
}
return WidgetLoading();
                             }),
                             )
                             ) 
                      
                      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row rowName(String title, String value) {
    return Row(
      children: [
        CustomLabel(text: "$title: ", type: TextStyleType.f18_600),
        CustomLabel(text: value, type: TextStyleType.f18_600),
      ],
    );
  }
}
