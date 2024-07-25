import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_images.dart';
 
class WidgetNetworkImage extends StatelessWidget {
  const WidgetNetworkImage(
      {super.key,
      required this.link,
      required this.size,
      this.fitType = BoxFit.cover});

  final String link;
  final Size size;
  final BoxFit fitType;
  @override
  Widget build(BuildContext context) {
    // print(link);
    return CachedNetworkImage(
        fit: fitType,
        height: size.height.h,
        width: size.width.w,
        imageUrl: link,
        placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
              strokeWidth: 1,
              color: Colors.red,
            )),
        errorWidget: (context, url, error) => ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Colors.grey.shade300,
                height: size.height.h,
                width: size.width.w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AppImages.globalBG),
                ),
              ),
            ));
  }
}

class WidgetNetworkImageWithOutSize extends StatelessWidget {
  const WidgetNetworkImageWithOutSize(
      {super.key,
      required this.link,
    
      this.fitType = BoxFit.cover});

  final String link;
  
  final BoxFit fitType;
  @override
  Widget build(BuildContext context) {
    // print(link);
    return CachedNetworkImage(
        fit: fitType,
        // height: size.height.h,
        // width: size.width.w,
        imageUrl: link,
        placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
              strokeWidth: 1,
              color: Colors.red,
            )),
        errorWidget: (context, url, error) => ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Colors.grey.shade300,
                // height: size.height.h,
                // width: size.width.w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AppImages.globalBG),
                ),
              ),
            ));
  }
}
