import 'package:esc/screens/home_screen.dart';
import 'package:esc/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 2),
            _buildImageSector(),
            SizedBox(height: 30),
            _buildTextSector(),
            Spacer(),
            _buildLoginButtons(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildImageSector() {
  return Center(
    child: Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.black, // 배경색
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(
          "assets/images/leesoonsin2.png",
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}

Widget _buildTextSector() {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "이순신 랠리,",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        Text(
          "간편하게 로그인하고 시작하세요",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}

Widget _buildLoginButtons(BuildContext context) {
  return Column(
    children: [
      _buildGuestLoginButton(context),
      _buildGoogleLoginButton(),
      _buildAppleLoginButton(context),
      _buildPrivacyPolicyLink(),
    ],
  );
}

Widget _buildGuestLoginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: GestureDetector(
      onTap: () async {
        print("게스트로 로그인");
      },
      child: Container(
        height: 56,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 169, 169, 169).withOpacity(0.3),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: const Color.fromARGB(255, 123, 123, 123),
              size: 34,
            ),
            const SizedBox(width: 14),
            Text(
              '게스트로 시작하기',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildAppleLoginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: GestureDetector(
      onTap: () async {},
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/apple_logo.png', width: 28, height: 28),
            const SizedBox(width: 14),
            Text(
              'Apple로 시작하기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildGoogleLoginButton() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 211, 211, 211),
              offset: Offset(1, 2),
            ),
          ],
        ),
        height: 56,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/google_logo.png', width: 28, height: 28),
            const SizedBox(width: 14),
            Text(
              'Google로 시작하기',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildPrivacyPolicyLink() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.privacy_tip_outlined, size: 12, color: Colors.grey[600]),
        SizedBox(width: 4),
        Text(
          '개인정보 처리방침',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    ),
  );
}
