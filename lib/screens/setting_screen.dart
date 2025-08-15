import 'package:esc/player.dart';
import 'package:esc/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key, required this.from});

  String from;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final TextEditingController controller = TextEditingController();
  bool buttonEnabled = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            print("뒤로가기");
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextSector(),
            _buildTextField(controller, onChanged),
            Spacer(),
            _buildButton("완료하기", buttonEnabled, onCompleted),
          ],
        ),
      ),
    );
  }

  void onChanged() {
    if (controller.text.isNotEmpty) {
      setState(() {
        buttonEnabled = true;
      });
    } else {
      setState(() {
        buttonEnabled = false;
      });
    }
  }

  void onCompleted() {
    Player.setNickName(controller.text);
    if (widget.from == "main" || widget.from == "onboarding") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.pop(context);
    }
  }
}

Widget _buildTextSector() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    child: Text(
      "닉네임을 입력해볼까요?",
      style: TextStyle(
        fontSize: 22,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _buildTextField(
  TextEditingController _controller,
  VoidCallback onChanged,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: _controller,
      onChanged: (str) => onChanged(),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: "닉네임 입력",
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    ),
  );
}

Widget _buildButton(String text, bool isEnabled, VoidCallback onRegistered) {
  return ElevatedButton(
    onPressed: isEnabled ? onRegistered : null,
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 60),
      backgroundColor: isEnabled ? Colors.black : Colors.grey.withAlpha(50),
      foregroundColor: Colors.white,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    child: Text(text),
  );
}
