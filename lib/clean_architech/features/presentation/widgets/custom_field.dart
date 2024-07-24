import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_colors.dart'; 

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      required this.controller,
      required this.fieldTitle,
      required this.hintTitle,
      this.stopEditing,
      this.keyBoardType,
      this.onEditDone,
      this.fNode,
      this.actionBtn});
  final FocusNode? fNode;
  final Function? onEditDone;
  final TextEditingController controller;
  final String fieldTitle;
    final String hintTitle;
  final TextInputType? keyBoardType;
  final TextInputAction? actionBtn;
  final bool? stopEditing;
  @override
  Widget build(BuildContext context) {
    // final scheme = Theme.of(context).colorScheme;
    var size = 25.0;
   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle,
          style: 
          GoogleFonts.nunitoSans(
              color: AppColors.black,
              //fontFamily:GoogleFonts.nunitoSans(),
              fontSize: 16,
              //fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400),
        ),
        // const SizedBox(
        //   height: 5,
        // ),
        TextFormField(
          
          focusNode: fNode,
          readOnly: (stopEditing == null) ? false : true,
          // style: fieldStyle(),
          inputFormatters: (keyBoardType == TextInputType.emailAddress)
              ? [FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))]
              : (keyBoardType == TextInputType.number)
                  ? [
                      FilteringTextInputFormatter.digitsOnly,
                    ]
                  : null,
          controller: controller,
          textInputAction:
              (actionBtn == null) ? TextInputAction.next : actionBtn,
          keyboardType: keyBoardType,
          autofocus: false,
          
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
            // contentPadding: EdgeInsets.zero,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            //contentPadding: const EdgeInsets.symmetric(horizontal: 5),
            //counterText: "",
            errorText: null,
            hintText: hintTitle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.blue,width: 5)),
            //labelText: hintTxt,
            // prefixIconConstraints:
            //     BoxConstraints(minHeight: size, minWidth: size),
            // prefixIcon: Container(
            //     margin: const EdgeInsets.only(left: 10),
            //     child: findPreFixIcon(context: context, size: size)),
 
          ),

          validator: (text) {
            if (controller.text.isEmpty) {
              return 'Field is empty';
            } else if (keyBoardType == TextInputType.emailAddress) {
              if (controller.text.validateEmail()) {
                //emailValidated = true;
                return null;
              } else {
                // emailValidated = false;
                return "Invalid Email";
              }
            }

            return null;
          },
          onEditingComplete: () {
            try {
            if (fNode != null) {
                //  print("yummy");
                onEditDone!();
              }
             
            } catch (e) {
              //onConsole("EXCEPION***** $e");
              FocusScope.of(context).nextFocus();
              // focusEmail.requestFocus();
            }
          },
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }


}

extension ExtendStrings on String{
    bool validateEmail() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}
   