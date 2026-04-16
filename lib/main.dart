import 'package:flutter/material.dart';
import 'package:multi_app/views/auth/signin_screen.dart';
import 'package:multi_app/views/main/home_screen.dart';
import 'package:multi_app/services/token_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final token = await TokenService.getAccessToken();

  Widget startScreen;

  /// 🔥 TOKEN БАР МА?
  if (token != null) {
    startScreen = const HomeScreen(); // 🔥 авто login
  } else {
    startScreen = const LoginScreen(); // 🔑 login
  }

  runApp(MyApp(startScreen: startScreen));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;

  const MyApp({super.key, required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: startScreen,
    );
  }
}
