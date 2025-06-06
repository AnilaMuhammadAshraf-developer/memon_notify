import 'package:flutter/material.dart';
import 'package:memon_notify/utils/app_strings.dart';
import 'package:memon_notify/widgets/custome_app_bar.dart';

class HomeScreen extends StatelessWidget{
  final fcmToken;
  const HomeScreen({super.key,required this.fcmToken});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: CustomAppBar(title:AppStrings.appTitle),
      body:Center(
        child: SelectableText(
            fcmToken != null
                ? 'Token:\n$fcmToken'
                : 'Getting FCM token...',
            textAlign: TextAlign.center,
          ),
      )
    );
  }
}