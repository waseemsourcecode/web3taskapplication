
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/authorization/cubit_auth.dart';
import 'clean_architech/features/presentation/routers/app_routes.dart';
import 'clean_architech/features/presentation/themes/dark_theme.dart';
import 'clean_architech/features/presentation/themes/light_theme.dart';
import 'injection_container.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

//flutter config --no-enable-web
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    //Hive.registerAdapter(GrowFilterAdapter());
   } catch (e) {
    //onConsole("Error while init Firebase App $e");
  }
  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
   const ScreenUtilInit(
            designSize: Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MyApp()),
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//final textTheme = Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return providersBox(context);
  }

  MultiBlocProvider providersBox(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CubitAuth>(
          create: (_) => di.sl<CubitAuth>()..appStarted(),
        ),
        
       
      ],
      child: MaterialApp(
        title: 'Offset',
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        debugShowCheckedModeBanner: true,
        themeMode: ThemeMode.dark,

        // themeMode: ThemeMode.system,

        theme: lightTheme(context),
        darkTheme: lightTheme(context),
        initialRoute: '/',
        onGenerateRoute: AppRoutes.route,
      ),
    );
  }

  // void getSilentCountryList(BuildContext context) {
  //   BlocProvider.of<CredentialCubit>(context).setCountryData();
  // }
}
