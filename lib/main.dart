import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:memon_notify/screens/home.dart';
import 'package:memon_notify/utils/app_strings.dart';
import 'firebase_options.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Background message received: ${message.notification?.title}");
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override
  _MyAppState createState()=>_MyAppState();
}
class _MyAppState extends State<MyApp>{
    String? _fcmToken;
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
    _initFirebaseMessaging();
  });
  }
  void _initFirebaseMessaging() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request permission (iOS specific)
    await messaging.requestPermission();

    // Get device token
    String? token = await messaging.getToken();
    setState(() {
      _fcmToken = token;
    });
  

    // Listen to messages when app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Foreground Message: ${message.notification?.title}');
   
  
      if (mounted) {
        print("context mounted");
       scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
          content: Text('🔔 ${message.notification?.title ?? "New Notification"}'),
        ));
      }
  
      
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
       scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      home: HomeScreen(fcmToken: _fcmToken),
    );
  }
}