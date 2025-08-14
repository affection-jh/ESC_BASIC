import 'package:flutter/material.dart';

class MemberPendingScreen extends StatefulWidget {
  const MemberPendingScreen({super.key});

  @override
  State<MemberPendingScreen> createState() => _MemberPendingScreenState();
}

class _MemberPendingScreenState extends State<MemberPendingScreen> {
  List<String> players = ["가", "나", "다", "라"];
  bool isPresident = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextSector("나만 아니면 돼", "누가 마실까요?"),
            _buildCodeSector(context, "123456"),
            _buildGridSection(context, players),
            if (isPresident) _buildButton("시작하기", true, () {}),
          ],
        ),
      ),
    );
  }
}

//텍스트 섹터
Widget _buildTextSector(String subText, String mainText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        subText,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      Text(
        mainText,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    ],
  );
}

//인증코드 영역
Widget _buildCodeSector(BuildContext context, String code) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 253, 253),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 218, 218, 218),
            offset: Offset(2, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              code,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
          ),
        ],
      ),
    ),
  );
}

//참여 인원 그리드 뷰
Widget _buildGridSection(BuildContext context, List<String> players) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1.5,
        ),
        itemCount: players.length,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildCard(players[index]),
            ),
      ),
    ),
  );
}

//멤버 카드
Widget _buildCard(String title) {
  return Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 249, 249),
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 224, 224, 224),
          offset: Offset(2, 2),
          blurRadius: 7,
        ),
      ],
    ),

    child: Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

//시작하기 버튼
Widget _buildButton(String text, bool isEnabled, VoidCallback onRegistered) {
  return ElevatedButton(
    onPressed: isEnabled ? onRegistered : null,
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 60),
      backgroundColor: isEnabled ? Colors.black : Colors.grey.withAlpha(50),
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
    child: Text(text),
  );
}
