import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appemptyscreen extends StatelessWidget {
  const Appemptyscreen({
    super.key,
    this.message,
    this.onPressed,
    this.pressText,
  });
  final String? message, pressText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: Get.width * 0.75,
          minWidth: Get.width * 0.65,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            disabledBackgroundColor: Colors.grey.shade200,
            backgroundColor: Colors.grey.shade200,
            foregroundColor: Colors.brown.shade700,
            disabledForegroundColor: Colors.brown.shade700,
            disabledIconColor: Colors.brown.shade700,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Column(
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.info, size: 30),
              Text(
                message ?? 'No Data Available',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (onPressed != null)
                Text(
                  pressText ?? 'Tap to add ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.brown.shade400,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
