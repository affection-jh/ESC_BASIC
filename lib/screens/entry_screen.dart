import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
//import 'package:pin_code_fields/pin_code_fields.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  //사용자가 입력한 텍스트를 관리하고 저장하는 컨트롤러
  final TextEditingController controller = TextEditingController();

  //코드가 틀렸을 때 처리를 위한 필드
  bool hasError = false;
  String errorMessage = "";

  bool showButton = false;

  @override
  void dispose() {
    if (mounted) {
      try {
        controller.dispose();
      } catch (e) {
        print(e);
      }
    }
    super.dispose();
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
            _buildTextSector("누가 마실까요"),
            _buildPinCodeSection(
              context,
              controller,
              onTextChanged,
              hasError,
              errorMessage,
            ),
            _buildButton("입장하기", showButton, () {}),
          ],
        ),
      ),
    );
  }

  onTextChanged(String) {
    if (hasError) {
      setState(() {
        hasError = false;
        errorMessage = '';
      });
    }
    if (controller.text.length == 6) {
      setState(() {
        showButton = true;
      });
    } else {
      setState(() {
        showButton = false;
      });
    }
  }

  Widget _buildTextSector(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      ],
    );
  }

  //핀 코드 입력 위젯
  Widget _buildPinCodeSection(
    BuildContext context,
    TextEditingController controller,
    void Function(String) onTextChanged,
    bool hasError,
    String? errorMessage,
  ) {
    return Column(
      children: [
        PinCodeTextField(
          autoFocus: true,
          controller: controller,
          length: 6,
          obscureText: false,
          cursorColor: hasError ? Colors.red : Colors.black,
          animationType: AnimationType.fade,
          animationDuration: Duration(milliseconds: 300),
          onChanged: (value) => onTextChanged(value),
          appContext: context,
          textStyle: TextStyle(
            fontSize: 24,
            color: hasError ? Colors.red : Colors.black,
          ),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(8),
            fieldHeight: 60,
            fieldWidth: 50,
            activeColor: hasError ? Colors.red : Colors.black,
            selectedColor: hasError ? Colors.red : Colors.black,
            inactiveColor: hasError ? Colors.red.shade300 : Colors.grey,
            activeFillColor: Colors.transparent,
            selectedFillColor: Colors.transparent,
            inactiveFillColor: Colors.transparent,
          ),
          keyboardType: TextInputType.number,
        ),

        if (hasError)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  errorMessage ?? '',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
}
