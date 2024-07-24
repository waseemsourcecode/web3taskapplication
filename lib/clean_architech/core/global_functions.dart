import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web3shopping_app/clean_architech/core/constants/app_colors.dart'; 
void showSnackBar(String pin, BuildContext context) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 4),
    content: SizedBox(
      height: 80.0,
      child: Center(
        child: Text(
          'Pin Submitted: $pin',
          style: const TextStyle(fontSize: 25.0),
        ),
      ),
    ),
    backgroundColor: Colors.green,
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

Widget failedToLoadImage({required Function function}) {
  return InkWell(
      onTap: () {
        function();
      },
      child: const Column(
        children: [Icon(Icons.refresh), Text('Reload')],
      ));
}

// Widget failedToLoadData(
//     {required DataResponseStatus reason,
//     required Function function,
//     String message = ''}) {
//   var customMsg = message;
//   dynamic myIcon = const Icon(Icons.warning, color: Colors.amber);
//   switch (reason) {
//     case DataResponseStatus.empty:
//       customMsg = 'No data found';
//       myIcon = const Icon(Icons.hourglass_empty);
//       break;
//     case DataResponseStatus.noNetwork:
//       customMsg = 'No Network.';

//       myIcon = Image.asset(width: 30, height: 30, MyAssets.profile);
//       break;

//     default:
//   }
//   return Align(
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           IconButton(
//             onPressed: () {
//               function();
//             },
//             icon: const Icon(
//               Icons.refresh,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 (customMsg.isEmpty) ? 'Failed To Load.' : customMsg,
//                 style: const TextStyle(fontSize: 17),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               myIcon
//             ],
//           )
//         ],
//       ));
// }

void onConsole(dynamic data, [int? code, bool warning = false]) {
  if (kDebugMode) {
    if (warning) {
      print("⚠️ WARNING : -> $data");
    } else {
      print(data);
    }
  }
}

// void responseToastWidget(DataResponseStatus reason) {
//   switch (reason) {
//     case DataResponseStatus.failed:
//       // toast('Failed to load.');
//       break;
//     case DataResponseStatus.empty:
//       toast('No data found.');
//       break;
//     case DataResponseStatus.noNetwork:
//       toast('oops no netowrk');
//       break;
//     case DataResponseStatus.success:
//       toast('success');
//       break;
//     default:
//   }
// }

Widget loadingIndicatorProgressBar({String? data}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          backgroundColor: AppColors.red,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          data ?? "Requesting...",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

void snackBarNetwork({String? msg, GlobalKey<ScaffoldState>? scaffoldState}) {
  ScaffoldMessenger.of(scaffoldState!.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("$msg"), const Icon(Icons.error)],
      ),
    ),
  );
}

void snackBar(
    {required String msg, required GlobalKey<ScaffoldState> scaffoldState}) {
  ScaffoldMessenger.of(scaffoldState.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            msg,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    ),
  );
}

// void toastEndPoints(DataResponseStatus reason) {
//   var message = '';
//   switch (reason) {
//     case DataResponseStatus.noNetwork:
//       message = "Please connect to internet";
//       break;
//     default:
//   }
//   Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.black54,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget verticalDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    height: 18,
    width: 1.0,
    decoration: BoxDecoration(color: Colors.black.withOpacity(.4)),
  );
}
