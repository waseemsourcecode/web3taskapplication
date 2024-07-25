import 'package:flutter/material.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/widgets/custom_label.dart';

class WidgetLoading extends StatelessWidget {
  const WidgetLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            CustomLabel(
                                text: "Please wait...",
                                type: TextStyleType.f12_400Type2)
                          ],
                        ),
    );
  }
}
