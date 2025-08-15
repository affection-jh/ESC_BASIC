import 'package:esc/player.dart';
import 'package:esc/screens/home_screen.dart';
import 'package:esc/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Future<String?> getNickName() async {
    final pref = await SharedPreferences.getInstance();
    return await pref.getString("nickname");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FutureBuilder(
        future: getNickName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            Player.setNickName(snapshot.data!);
            return HomeScreen();
          } else {
            return SettingScreen(from: "main");
          }
        },
      ),
    );
  }
}
