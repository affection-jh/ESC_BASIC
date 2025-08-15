import 'package:uuid/uuid.dart';

class Player {
  static String nickname = "";
  static String userId = "";

  static void setNickName(String text) {
    nickname = text;
    if (userId.isEmpty) {
      userId = Uuid().v6();
      print("nickname : $nickname");
      print("userId : $userId");
    }
  }
}
