// @dart=2.9
import 'package:flutter/material.dart';
import 'package:mychatly/screens/welcome_screen.dart';
import 'package:mychatly/screens/login_screen.dart';
import 'package:mychatly/screens/registration_screen.dart';
import 'package:mychatly/screens/chat_screen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) =>  WelcomeScreen(),
        LoginScreen.id: (context) =>  LoginScreen(),
        RegistrationScreen.id: (context) =>  RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}