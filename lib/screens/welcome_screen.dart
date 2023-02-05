import 'package:flutter/material.dart';
import 'package:mychatly/screens/login_screen.dart';
import 'package:mychatly/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mychatly/Components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{

  late AnimationController controller;
  //late AnimationController contro;
  late Animation animation;
  //late Animation anim;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    /*contro = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );*/


    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    controller.forward();

    animation.addStatusListener((status) {
      if( status == AnimationStatus.completed){
        controller.reverse(from: 1.0);
      }
      else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });

   /* contro.forward();

    anim =ColorTween(
      begin: Colors.black12,
      end: Colors.white,
    ).animate(contro);

    anim.addStatusListener((status) {
      if( status == AnimationStatus.completed){
        contro.reverse(from: 1.0);
      }
      else if(status == AnimationStatus.dismissed){
        contro.forward();
      }
    });

    contro.addListener(() {
      setState(() {
      });
    });
    */


    controller.addListener(() {
      setState(() {
      });
    });


  }

  @override
  void dispose() {
    controller.dispose();
    //contro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      height: 60.0,
                      width: 300,
                      child: Center(child: Image.asset('images/mychatly.png')),
                    ),
                    const SizedBox(
                      //width: 200.0,
                      height: 100.0,
                    ),
                    Hero(
                      tag: 'logo',
                      child: Container(
                        //height: 60.0,
                        height: animation.value * 60,
                        width: 300,
                        child: Center(child: Image.asset('images/logo.png')),
                      ),
                    ),
                    const SizedBox(
                      width: 200.0,
                      height: 250.0,
                    ),
                    Center(
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Horizon',
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText('LOGIN/REGISTER'),
                            WavyAnimatedText('LET\'S CHAT'),
                          ],
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          onTap: () {
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                RoundedButton(
                  Colors.lightBlueAccent,
                  'Log In',
                  () {
                    Navigator.pushNamed(
                        context,
                        LoginScreen.id
                    );
                  },
                ),
                RoundedButton(
                  Colors.blueAccent,
                  'Register',
                      () {
                    Navigator.pushNamed(
                        context,
                        RegistrationScreen.id
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
