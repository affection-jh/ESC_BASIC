import 'package:esc/screens/entry_screen.dart';
import 'package:esc/screens/setting_screen.dart';
import 'package:esc/screens/view_swicher.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingScreen(from: "home"),
                ),
              );
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 255, 255, 255),
              const Color.fromARGB(255, 255, 225, 235),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              _buildTextSector(),
              _buildImageSector(),
              _buildRoomCreationButton("게임 방 만들기", createRoom),
              SizedBox(height: 10),
              _buildJoinButton("게임 참여하기", joinRoom),
            ],
          ),
        ),
      ),
    );
  }

  void createRoom() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewSwicher(gameState: "WAITING_ROOM"),
      ),
    );
  }

  void joinRoom() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EntryScreen()),
    );
  }
}

Widget _buildTextSector() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "hun님 환영합니다.",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
      ),
      Text(
        "오늘도 행운을 빌어요.",
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget _buildImageSector() {
  return Expanded(
    child: Row(
      children: [
        Spacer(),
        Image.asset("assets/images/leesoonsin1.png", width: 300),
      ],
    ),
  );
}

Widget _buildRoomCreationButton(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "게임 방 만들기",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("언제 어디서든 가볍게 즐겨보세요"),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildJoinButton(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "게임 참여하기",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text("초대코드로 친구들과 함께", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(
              width: 80,
              child: Image.asset("assets/images/turtle_ship.png"),
            ),
          ],
        ),
      ),
    ),
  );
}
