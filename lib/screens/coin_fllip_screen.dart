import 'package:esc/util/coin_flip.dart';
import 'package:flutter/material.dart';

class CoinFlipScreen extends StatefulWidget {
  const CoinFlipScreen({super.key});

  @override
  State<CoinFlipScreen> createState() => _CoinFlipScreenState();
}

class _CoinFlipScreenState extends State<CoinFlipScreen> {
  bool showButton = false;
  String? coin1;
  String? coin2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTextSector("동전을 클릭해 멈추세요", "행운을 빌어요^^"),
            SizedBox(height: 30),
            Expanded(
              child: CoinSpinWidget(
                coinSpacing: 80,
                onCoin1Stopped: onCoin1Stopped,
                onCoin2Stopped: onCoin2Stopped,
              ),
            ),
            _buildButton("다음으로", showButton, () {
              coin1 = null;
              coin2 = null;
            }),
          ],
        ),
      ),
    );
  }

  void onCoin1Stopped(String state) {}
  void onCoin2Stopped(String state) {}
}

//텍스트 영역
Widget _buildTextSector(String subText, String mainText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
              ],
            ),
            Spacer(),
          ],
        ),
      ],
    ),
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
