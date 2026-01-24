import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppErrorScreen extends StatelessWidget {
  const AppErrorScreen({super.key, this.message});
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          spacing: 15,
          children: [
            Icon(
              Icons.error,
              size: 70,
              color: Colors.red.shade400,
            ),
            Text(
              message ?? 'Something went wrong!, please try again later.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.red.shade400),
            ),
            SizedBox(height: 5),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
