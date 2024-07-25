import 'package:flutter/material.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/screens/authorizatin/login/login_screen.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/screens/dashboard/home_screen.dart';

import '../../../core/global_functions.dart';
import '../screens/splash_screen.dart';
import 'app_screens.dart';
 
//   Navigator.pushNamedAndRemoveUntil(
// context,
// PageRouteBuilder(
// pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
// transitionsBuilder: (context, animation, secondaryAnimation, child) {
// var begin = Offset(1.0, 0.0);
// var end = Offset.zero;
// var curve = Curves.ease;
// var tween = Tween(begin: begin, end: end)
// .chain(CurveTween(curve: curve));
// return SlideTransition(
// position: animation.drive(tween),
// child: child,
// );
//       }));
// var curve = Curves.ease;
// var curveTween = CurveTween(curve: curve);
Route createRoute(destination) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destination,
    // transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //   return child;
    // },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      //final tween = Tween(begin: begin, end: end);

      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      // final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

class AppRoutes {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;
    onConsole(settings.name);
    onConsole(args);
    switch (settings.name) {
      case AppScreens.splash:
        return materialBuilder(
          widget: const ScreenSplash(),
          routeSettings: settings,
        );
     
      case AppScreens.login:
        return materialBuilder(
          widget: const LoginScreen(
           
          ),
          routeSettings: settings,
        );
         case AppScreens.home:
        return materialBuilder(
          widget:   HomeScreen(
           
          ),
          routeSettings: settings,
        );
      // case PageConst.signup:
      //   return materialBuilder(
      //     widget: const PageSignUp(),
      //     routeSettings: settings,
      //   );

    
      default:
        return materialBuilder(
          widget: const ErrorPage(),
          routeSettings: settings,
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coming Soon!"),
      ),
      body: const Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning, color: Colors.yellow,),
            Text("Work in progress"),
          ],
        ),
      ),
    );
  }
}

MaterialPageRoute materialBuilder(
    {required RouteSettings routeSettings, required Widget widget}) {
  return MaterialPageRoute(settings: routeSettings, builder: (_) => widget);
}
