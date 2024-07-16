import 'package:flutter/material.dart';
import 'package:travel_app/screens/home/home_screen.dart';
import 'screens/splash/splash_screen.dart';

void main(){
  runApp(const TravelApp());
}

class TravelApp extends StatefulWidget {
  const TravelApp({super.key});

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        '/home' : (context) => const HomePage(),
      },
    );
  }
}
