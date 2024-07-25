import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patterns_canvas/patterns_canvas.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_dimens.dart';
import 'package:web3shopping_app/clean_architech/core/global_functions.dart';
import 'package:web3shopping_app/clean_architech/core/utils/screen_lifecycle.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/login/cubit_login.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/login/state_login.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/routers/app_navigations.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/routers/app_screens.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/app_elevated_button.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/custom_label.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../widgets/custom_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateLoginScreen();
  }
}

class _StateLoginScreen extends State<LoginScreen> {
  //Variables
  bool loginSelected = true;
  int viewHeight = 350;
  bool processing = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final eFocus = FocusNode();
  final pFocus = FocusNode();
//Signup
  final spUsernameController = TextEditingController();
  final spEmailController = TextEditingController();
  final spPasswordController = TextEditingController();
  final spConfirmPasswordController = TextEditingController();
  final spusernameFocus = FocusNode();
  final spEFocus = FocusNode();
  final spConfirmPFocus = FocusNode();
  final spPFocus = FocusNode();

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
              child: Container(
                width: double.infinity,
                height: viewHeight.toDouble(),
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
                child: BlocConsumer<CubitRegister, StateRegister>(
                    listener: (context, state) {
                  if (state is StateRegistered) {
                    AppNavigations.pushToInitial(context, AppScreens.home);
                  }
                }, builder: (context, state) {
                  if (state is StateRegistering) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        CustomLabel(
                            text: "Please wait...",
                            type: TextStyleType.f12_400Type2)
                      ],
                    );
                  } else if (state is StateRegisteredFailed) {
                    toast(state.reason);
                  }
                  return viewBody(context);
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding viewBody(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30, bottom: 30, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topRowView(),
          Expanded(
              child:
                  (loginSelected) ? loginView(context) : signupView(context)),
        ],
      ),
    );
  }

  Row topRowView() {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              setState(() {
                loginSelected = true;
                viewHeight = 350;
              });
            },
            child: Column(
              children: [
                CustomLabel(
                  text: "Login",
                  type: TextStyleType.f16_600,
                ),
                Container(
                  color: (loginSelected) ? AppColors.primary : AppColors.gray,
                  height: 5,
                  width: double.infinity,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              setState(() {
                loginSelected = false;
                viewHeight = 570;
              });
            },
            child: Column(
              children: [
                CustomLabel(
                  text: "Signup",
                  type: TextStyleType.f16_600,
                ),
                Container(
                  color: (loginSelected) ? AppColors.gray : AppColors.primary,
                  height: 5,
                  width: double.infinity,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Form loginView(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomField(
              controller: emailController,
              fieldTitle: "Email",
              fNode: eFocus,
              onEditDone: () {
                try {
                  _formKey.currentState?.validate();
                  FocusScope.of(context).nextFocus();
                  setState(() {});
                } catch (e) {
                  pFocus.requestFocus();
                }
              },
              hintTitle: 'Please enter email',
            ),
            // const FieldLabel(title: SetString.password),
            // padVertical(5),
            dimenVertical(),
            fieldPassword(passwordController, context),
            const Spacer(),
            AppElevatedButton(
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    toast("Please enter email");
                  } else if (passwordController.text.isEmpty) {
                    toast("Please enter password");
                  } else if (!emailController.text.validateEmail()) {
                    toast("You enter invalid email");
                  } else {
                    //  toast("Ready");
                    BlocProvider.of<CubitRegister>(context).login(
                        email: emailController.text,
                        password: passwordController.text);
                  }
                },
                borderRadius: BorderRadius.circular(5),
                child: const Text("Login"))
          ],
        ));
  }

  fieldPassword(TextEditingController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: GoogleFonts.nunitoSans(
              color: AppColors.black,
              //fontFamily:GoogleFonts.nunitoSans(),
              fontSize: 16,
              //fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400),
        ),
        TextFormField(
          // style: context.fieldStyleType(),
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
          ],
          controller: controller,
          textInputAction: TextInputAction.done,
          obscureText: true,
          obscuringCharacter: "*",
          keyboardType: TextInputType.visiblePassword,
          focusNode: pFocus,
          decoration: InputDecoration(
            fillColor: Colors.yellow,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: AppColors.primary, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            //  counterText: "",
            //errorText: emailValidation,
            // focusedErrorBorder: InputBorder.none,
            hintText: "Please enter password",
          ),
          validator: (text) {
            if (controller.text.isEmpty) {
              return "Empty";
            }
            return null;
          },
          onEditingComplete: () {
            ScreenLifeCycle.releaseKeyBoard(ofContext: context);
          },
        ),
      ],
    );
  }

  signUpFieldPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: GoogleFonts.nunitoSans(
              color: AppColors.black,
              //fontFamily:GoogleFonts.nunitoSans(),
              fontSize: 16,
              //fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400),
        ),
        TextFormField(
          // style: context.fieldStyleType(),
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
          ],
          controller: spPasswordController,
          textInputAction: TextInputAction.done,
          obscureText: true,
          obscuringCharacter: "*",
          keyboardType: TextInputType.visiblePassword,
          focusNode: spPFocus,
          decoration: InputDecoration(
            fillColor: Colors.yellow,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: AppColors.primary, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            //  counterText: "",
            //errorText: emailValidation,
            // focusedErrorBorder: InputBorder.none,
            hintText: "Please enter password",
          ),
          validator: (text) {
            if (spPasswordController.text.isEmpty) {
              return "Empty";
            }
            return null;
          },
          onEditingComplete: () {
            ScreenLifeCycle.releaseKeyBoard(ofContext: context);
          },
        ),
      ],
    );
  }

  confirmPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confim Password",
          style: GoogleFonts.nunitoSans(
              color: AppColors.black,
              //fontFamily:GoogleFonts.nunitoSans(),
              fontSize: 16,
              //fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400),
        ),
        TextFormField(
          // style: context.fieldStyleType(),
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
          ],
          controller: spConfirmPasswordController,
          textInputAction: TextInputAction.done,
          obscureText: true,
          obscuringCharacter: "*",
          keyboardType: TextInputType.visiblePassword,
          focusNode: spConfirmPFocus,
          decoration: InputDecoration(
            fillColor: Colors.yellow,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: AppColors.primary, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            //  counterText: "",
            //errorText: emailValidation,
            // focusedErrorBorder: InputBorder.none,
            hintText: "Please enter password",
          ),
          validator: (text) {
            if (spConfirmPasswordController.text.isEmpty) {
              return "Empty";
            }
            return null;
          },
          onEditingComplete: () {
            ScreenLifeCycle.releaseKeyBoard(ofContext: context);
          },
        ),
      ],
    );
  }

  signupView(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomField(
              controller: spUsernameController,
              fieldTitle: "Username",
              fNode: spusernameFocus,
              onEditDone: () {
                try {
                  _formKey.currentState?.validate();
                  FocusScope.of(context).nextFocus();
                  setState(() {});
                } catch (e) {
                  pFocus.requestFocus();
                }
              },
              hintTitle: 'Please enter your name',
            ),

            CustomField(
              controller: spEmailController,
              fieldTitle: "Email",
              fNode: spEFocus,
              onEditDone: () {
                try {
                  _formKey.currentState?.validate();
                  FocusScope.of(context).nextFocus();
                  setState(() {});
                } catch (e) {
                  pFocus.requestFocus();
                }
              },
              hintTitle: 'Please enter email',
            ),
            // const FieldLabel(title: SetString.password),
            // padVertical(5),
            dimenVertical(),
            signUpFieldPassword(context),
            dimenVertical(),
            confirmPassword(context),
            const Spacer(),
            AppElevatedButton(
                onPressed: () {
                  if (spEmailController.text.isEmpty) {
                    toast("Please enter email");
                  } else if (spPasswordController.text.isEmpty) {
                    toast("Please enter password");
                  } else if (spConfirmPasswordController.text.isEmpty) {
                    toast("Please enter confirm password");
                  } else if (spPasswordController.text !=
                      spConfirmPasswordController.text) {
                    toast("Password failed to match");
                  } else {
                    BlocProvider.of<CubitRegister>(context).registerUser(
                        spUsernameController.text,
                        spEmailController.text,
                        spPasswordController.text);
                  }
                },
                borderRadius: BorderRadius.circular(5),
                child: const Text("Signup"))
          ],
        ));
  }
}

class ContainerPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    DiagonalStripesLight(
            bgColor: Colors.white,
            fgColor: Colors.grey.shade100,
            featuresCount: 100)
        .paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
