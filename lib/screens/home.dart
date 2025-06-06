import 'package:flutter/material.dart';
import 'package:memon_notify/utils/app_strings.dart';
import 'package:memon_notify/widgets/custome_app_bar.dart';

class HomeScreen extends StatelessWidget {
  final fcmToken;
  const HomeScreen({super.key, required this.fcmToken});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.appTitle),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Your Device Token",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  fcmToken != null
                      ? SelectableText('$fcmToken', textAlign: TextAlign.left)
                      : Text('Getting FCM token...'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
