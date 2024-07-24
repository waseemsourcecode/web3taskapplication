import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../widgets/custom_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateLoginScreen();
  }
}

class _StateLoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.globalBG),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
       // alignment: Alignment.center,
        children: [Padding(
          padding: const EdgeInsets.all(30.0),
          child: loginView(context),
        )]  /* add child content here */,
    ))
  ,
    );
    
   
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final eFocus = FocusNode();
  final pFocus = FocusNode();
  Form loginView(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomField(
              controller: emailController,
              fieldTitle: "Your email address",
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
           fieldPassword(context),
          ],
        ));
  }

fieldPassword(BuildContext context) {
    return TextFormField(
     // style: context.fieldStyleType(),
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))],
      controller: passwordController,
      textInputAction: TextInputAction.done,
      obscureText: true,
      obscuringCharacter: "*",
      keyboardType: TextInputType.visiblePassword,
      focusNode: pFocus,
      decoration: InputDecoration(

         fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 3
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        //  counterText: "",
        //errorText: emailValidation,
        // focusedErrorBorder: InputBorder.none,
        hintText: "Please enter password",
        //labelText: hintTxt,
        //prefixIconConstraints: BoxConstraints.lerp(),
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.only(left: 0, right: 0.0),
        //   child: Image.asset(
        //     MyAssets.password,
        //     color: Colors.grey,
        //   ),
        // ),
        // prefixIcon: Image.asset(
        //   MyAssets.password,
        //   color: Colors.grey,
        //   height: 20,
        //   fit: BoxFit.scaleDown,
        // ),
        // suffixIcon: IconButton(
        //   icon: Icon(
        //     (passwordSecure) ? Icons.visibility_off : Icons.visibility,
        //     color: Theme.of(context).secondaryHeaderColor,
        //   ),
        //   onPressed: () {
        //     setState(() {
        //       passwordSecure = !passwordSecure;
        //     });
        //   },
        // ),

        // // hintStyle: const TextStyle(color: Colors.black54),
      ),
      validator: (text) {
        if (passwordController.text.isEmpty) {
          return "Empty";
        }
        return null;
      },
      onEditingComplete: () {
        if (_formKey.currentState!.validate()) {
          // ScreenHea.releaseKeyBoard(ofContext: context);
          // callSignIn(emailController.text, passwordController.text);
        }
      },
    );
  }

 
}
