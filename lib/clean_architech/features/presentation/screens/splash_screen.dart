import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_images.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/authorization/cubit_auth.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/authorization/state_auth.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/global_functions.dart';
import '../routers/app_navigations.dart';
import '../routers/app_screens.dart';
 

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});
 
//https://dribbble.com/shots/18408638-E-Commerce-App
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitAuth, StateAuth>(builder: (context, state) {
      onConsole("STATE IS **** $state");
      if (state is AuthenticatedState) {
        waitAndMove(context, AppScreens.home, state);
        // return PageDashBoard();
      }
       else if (state is UnAuthenticatedState) {
        waitAndMove(context, AppScreens.login);
      } 
      // else if (state is AuthticatedAsGuest) {
      //   waitAndMove(context, PageConst.dashBoard, state);
      // } else if (state is NewToAppState) {
      //   waitAndMove(context, PageConst.onBoard, state.data);
      // }

      //return Container(color: Colors.amber,);
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
 Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:50.0,right: 50.0),
                    child: Image.asset(
                       AppImages.logo,
                    //  width: 211.w,
                    //  height: 40.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Text("W3 Shoppings",style: GoogleFonts.nunitoSans(fontSize:38))
        
          ],
          // color: (Theme.of(context).brightness == Brightness.light)
          //     ? AppColors.primary
          //     : AppColors.secondary, 
              //Theme.of(context).colorScheme.secondary,
         
        ),
      );
    });
  }

 
  void waitAndMove(BuildContext context, String destination,
      [onBoardData]) async {
    const waitFor = 1500;
    await Future.delayed(const Duration(milliseconds: waitFor), () async {
      AppNavigations.pushToInitial(context, destination, onBoardData);
    });
  }

  void getSilentCountryList() {
    // BlocProvider.of<CredentialCubit>(context).setCountryData();
  }
}
