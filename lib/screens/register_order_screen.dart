import 'package:flutter/material.dart';

class OrderRegisterScreen extends StatefulWidget {
  const OrderRegisterScreen({super.key});

  @override
  State<OrderRegisterScreen> createState() => _OrderRegisterScreenState();
}

class _OrderRegisterScreenState extends State<OrderRegisterScreen> {
  List<String> orderedPlayers = [];
  bool isRegistered = false;
  bool isPresident = false;

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextSector("아무나 먼저 자리순서대로", "순서를 등록해보아요", "장군님이 순서를 기억할거에요"),
            _buildOrderedPlayer(context, orderedPlayers),
            if (!isRegistered)
              _buildButton("등록하기", true, () {
                setState(() {
                  isRegistered = true;
                });
              }),
            if (isRegistered && isPresident) _buildButton("시작하기", true, () {}),
          ],
        ),
      ),
    );
  }
}

//텍스트 영역
Widget _buildTextSector(String subText, String mainText, String subsubText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subText,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w200),
            ),
            Text(
              mainText,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              subsubText,
              style: TextStyle(fontSize: 165, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ],
    ),
  );
}

//순서등록 영역
Widget _buildOrderedPlayer(BuildContext context, List<String> orderedPlayers) {
  return Expanded(
    child:
        orderedPlayers.isNotEmpty
            ? ListView.builder(
              itemCount: orderedPlayers.length,
              itemBuilder:
                  (context, index) => _buildCell(
                    orderedPlayers[index],
                    (index == orderedPlayers.length),
                  ),
            )
            : SizedBox(),
  );
}

//커스텀 셀
Widget _buildCell(String title, bool isLast) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.blue.shade700,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),

      // 세로 연결선
      if (!isLast) Container(width: 1, height: 10, color: Colors.grey.shade400),
      if (isLast) SizedBox(height: 50),
    ],
  );
}

//버튼
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
