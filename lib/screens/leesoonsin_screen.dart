import 'package:flutter/material.dart';

class LeesoonsinScreen extends StatefulWidget {
  const LeesoonsinScreen({super.key});

  @override
  State<LeesoonsinScreen> createState() => _LeesoonsinScreenState();
}

class _LeesoonsinScreenState extends State<LeesoonsinScreen> {
  bool isPresident = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextSector("이에스씨 장군님이 오셨어요!"),
            _buildImageSector(),
            if (isPresident) _buildButton("계속하기", true, () {}),
            if (!isPresident)
              _buildButton("방장이 계속하기를 누를 때까지 기다려요.", false, () {}),
          ],
        ),
      ),
    );
  }
}

//텍스트 섹터
Widget _buildTextSector(String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    ],
  );
}

Widget _buildImageSector() {
  return Expanded(child: Image.asset("assets/images/leesoonsin1.png"));
}

//버튼
Widget _buildButton(String text, bool isEnabled, VoidCallback onRegistered) {
  return ElevatedButton(
    onPressed: isEnabled ? onRegistered : null,
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 60),
      backgroundColor: isEnabled ? Colors.black : Colors.grey.withAlpha(50),
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    child: Text(text),
  );
}
