import 'package:flutter/material.dart';

class ScreenLifeCycle {
  static void releaseKeyBoard({required BuildContext ofContext}) {
    FocusScope.of(ofContext).requestFocus(FocusNode());
  }

  static void transferFieldControl(
      {required BuildContext ofContext, required FocusNode requestedFoucs}) {
    FocusScope.of(ofContext).requestFocus(requestedFoucs);
  }
  static bool isScrollReachEnd({required ScrollController scrollController}){
    return (scrollController.position.maxScrollExtent == scrollController.offset)? true : false;
  }
}
