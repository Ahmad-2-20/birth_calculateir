import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:birth_calculateir/screen/user.dart';
import 'package:birth_calculateir/youtals/factory_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/themmodle/thme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (contex) => ThemeChanger(Factory.light()),
  ));
}

class MyApp extends StatelessWidget {
  //الماثواد الاساسية للبارنامج
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        theme: theme.getTheme(),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          nextScreen: Directionality(
            child: User(),
            textDirection: TextDirection.rtl,
          ),
          splash: Container(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                height: double.infinity,
                width: double.infinity,
                image: AssetImage('images/background - Copy.png'),
              )),
          backgroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 1500),
          splashTransition: SplashTransition.rotationTransition,
          duration: 500,
          splashIconSize: 500,
        ));
  }
}
