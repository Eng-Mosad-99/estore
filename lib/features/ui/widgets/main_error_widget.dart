import 'package:flutter/material.dart';
import '../../../core/utils/app_styles.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    super.key,
    required this.errorMessage,
    this.onPressed,
  });
  final String errorMessage;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(errorMessage, style: AppStyles.medium14PrimaryDark),
       onPressed == null ? const SizedBox() : ElevatedButton(
          onPressed: onPressed,
          child: Text("Retry", style: AppStyles.medium14PrimaryDark),
        ),
      ],
    );
  }
}
