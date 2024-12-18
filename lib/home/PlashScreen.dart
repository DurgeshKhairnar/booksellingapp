import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:flutter/material.dart";
import "package:grouponproject/vaibhav/started.dart";
import "package:lottie/lottie.dart";

class Splash extends StatelessWidget{
  const Splash({super.key});
  get splash =>null;
  @override
  Widget build(BuildContext context){
    return AnimatedSplashScreen(splash:Column(
      children:[
        Center(
          child:LottieBuilder.asset("assets/splash.json")
        )
      ]
    )
    ,nextScreen: GlassMorphismContainer(),
    splashIconSize:411.5,
    backgroundColor:Colors.blue
    );
  }
}
