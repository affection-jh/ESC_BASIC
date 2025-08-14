import 'package:flutter/material.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({super.key});

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  String? coin1 = 'null';
  String? coin2 = 'null';
  int currentPlayerIndex = 0;
  List<String> players = ['p1', 'p2', 'p3'];

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
            _buildHeader(),
            _buildCurrentCoinState(coin1, coin2, "esc"),
            _buildPlayerInfo(context, players, currentPlayerIndex),
          ],
        ),
      ),
    );
  }
}

//제한 시간
Widget _buildHeader() {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "08:45",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 141, 179),
                ),
              ),
              Text(
                "시간이 끝나도 찾아와요!",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 160, child: Image.asset("assets/images/leesoonsin2.png")),
    ],
  );
}

//현재 턴인 사람의 동전 보여주기
Widget _buildCurrentCoinState(
  String? coin1,
  String? coin2,
  String currentPlayer,
) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "지금 $currentPlayer의 동전은?",
          style: TextStyle(
            color: const Color.fromARGB(255, 18, 18, 18),
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 226, 226, 226),
                offset: Offset(2, 2),
                blurRadius: 7,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (coin1 == 'null')
                _buildCoinPlaceHolder()
              else ...[
                if (coin1 == "head")
                  Image.asset("assets/images/coin_head.png")
                else if (coin1 == "tail")
                  Image.asset("assets/images/coin_tail.png"),
              ],

              if (coin2 == 'null')
                _buildCoinPlaceHolder()
              else ...[
                if (coin2 == "head")
                  Image.asset("assets/images/coin_head.png")
                else if (coin2 == "tail")
                  Image.asset("assets/images/coin_tail.png"),
              ],
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildCoinPlaceHolder() {
  return Container(
    width: 105,
    height: 105,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(300),
      color: const Color.fromARGB(255, 225, 225, 225),
      border: Border.all(color: Colors.grey),
    ),
    child: Center(child: Text("?", style: TextStyle(fontSize: 20))),
  );
}

//플레이어 리스트
Widget _buildPlayerInfo(
  BuildContext context,
  List<String> players,
  int currentPlayerIndex,
) {
  return Expanded(
    child:
        players.isNotEmpty
            ? ListView.builder(
              itemCount: players.length,
              itemBuilder:
                  (context, index) => _buildPlayerCard(
                    players[index],
                    (index == currentPlayerIndex),
                  ),
            )
            : SizedBox(),
  );
}

Widget _buildPlayerCard(String player, bool myTurn) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 241, 241, 241),
            offset: Offset(1, 1),
            blurRadius: 7,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color.fromARGB(255, 255, 171, 199),
              ),
              child: Center(
                child: Text(
                  player.substring(0, 1),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                player,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),

            Spacer(),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    myTurn
                        ? Colors.blue
                        : const Color.fromARGB(255, 183, 183, 183),
              ),
              child: Center(
                child: Text(
                  myTurn ? "현재 턴" : "대기 중",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
