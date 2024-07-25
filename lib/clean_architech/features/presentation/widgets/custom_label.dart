import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
 
class CustomLabel extends StatelessWidget {
  const CustomLabel(
      {super.key,
      required this.text,
      required this.type,
      this.maxLine,
      this.forceColor,
      this.forceAlignment,
      this.setTextScaller,
      this.fontTypeRegular,
      this.anyDecoration,
      this.overFlow});
  final String? text;
  final TextDecoration? anyDecoration;
  final TextStyleType type;
  final int? maxLine;
  final Color? forceColor;
  final TextAlign? forceAlignment;
  final TextOverflow? overFlow;
  final bool? setTextScaller;
  final bool? fontTypeRegular;
  @override
  Widget build(BuildContext context) {
    return Text(
      textScaler:
          (setTextScaller == null) ? null : const TextScaler.linear(0.8),
      overflow: overFlow,
      textAlign: forceAlignment,
      maxLines: maxLine,
      text ?? "Null",
      style: findStyle(context),
    );
  }

  TextStyle findStyle(BuildContext context) {
    var size = 10;
    var weight = FontWeight.normal;
    Color? themeColor;
    switch (type) {
       case TextStyleType.f10_400:
        size = 10;
        weight = FontWeight.w400;
        break;
      case TextStyleType.f20_400:
       size = 20;
        weight = FontWeight.w400;
        break;
      case TextStyleType.f18_400:
       size = 18;
        weight = FontWeight.w400;
        break;
        case TextStyleType.header:
        size = 24;
        weight = FontWeight.w400;
        break;
      case TextStyleType.f16_600:
        size = 16;
        weight = FontWeight.w600;
        break;
      case TextStyleType.f18_600:
        size = 18;
        weight = FontWeight.w600;
        break;

      case TextStyleType.f12_600:
        size = 12;
        weight = FontWeight.w600;
        themeColor = Theme.of(context).colorScheme.secondary;
        break;
      case TextStyleType.f12_300 || TextStyleType.f12_300Type2:
        size = 12;
        weight = FontWeight.w300;
        themeColor = (type == TextStyleType.f12_300Type2)
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary;
        break;
      
      case TextStyleType.f12_400 || TextStyleType.f12_400Type2:
        size = 12;
        weight = FontWeight.w400;
        themeColor = (type == TextStyleType.f12_400Type2)
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary;
        break;
      case TextStyleType.f16_400:
        size = 16;
        weight = FontWeight.w400;
        break;
      case TextStyleType.f22_600:
        size = 22;
        weight = FontWeight.w600;
        break;
      case TextStyleType.f22_400:
        size = 22;
        weight = FontWeight.w400;
        break;
      case TextStyleType.f10_300:
        size = 10;
        weight = FontWeight.w300;

        break;
      case TextStyleType.f13_400:
        size = 13;
        weight = FontWeight.w400;
        break;
      case TextStyleType.f14_400 || TextStyleType.f14_400Type2:
        size = 14;
        weight = FontWeight.w400;
        themeColor = (type == TextStyleType.f14_400)
            ? Colors.white
            : Theme.of(context).colorScheme.primary;
        break;
      case TextStyleType.f17_600:
        size = 17;
        weight = FontWeight.w600;

        themeColor = (type == TextStyleType.f14_600Type2)
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary;

      case TextStyleType.f14_600 || TextStyleType.f14_600Type2:
        size = 14;
        weight = FontWeight.w600;

        themeColor = (type == TextStyleType.f14_600Type2)
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary;
        break;
    }
    var isItalic = false ;
    if(fontTypeRegular != null){
 
      isItalic = false ;
    }
//     if(fontTypeRegular == FontStyle.italic || type == TextStyleType.header){
// isItalic = true ;
//     }
    return GoogleFonts.aboreto(
        decoration: (anyDecoration == null) ? null : anyDecoration,
        color: (forceColor == null) ? themeColor : forceColor,
      
        fontSize: size.toDouble(),
        fontStyle: (isItalic)
            ? FontStyle.italic
            : FontStyle.normal,
        fontWeight: weight);
  }
}

enum TextStyleType {
  f16_600,
  f12_600,
  f12_300,
  f12_300Type2,
  f12_400,
  f12_400Type2,
  f22_600,
  f10_300,
  f14_600,
  f14_600Type2,
  f16_400, 
  f14_400,
  f18_600,
  f14_400Type2,
  f13_400,
  f17_600,
  f22_400, header, f18_400, f20_400, f10_400
}
