import 'package:esc/player.dart';
import 'package:esc/screens/coin_fllip_screen.dart';
import 'package:esc/screens/home_screen.dart';
import 'package:esc/screens/leesoonsin_screen.dart';
import 'package:esc/screens/member_pending_screen.dart';
import 'package:esc/screens/register_order_screen.dart';
import 'package:flutter/material.dart';

class ViewSwicher extends StatefulWidget {
  ViewSwicher({super.key, required this.gameState});

  String gameState;

  @override
  State<ViewSwicher> createState() => _ViewSwicherState();
}

class _ViewSwicherState extends State<ViewSwicher> {
  @override
  Widget build(BuildContext context) {
    if (Player.userId.isEmpty) return HomeScreen();

    return _buildView(context, widget.gameState);
  }
}

Widget _buildView(BuildContext context, String gameState) {
  switch (gameState) {
    case 'WAITING_ROOM':
      return MemberPendingScreen();

    case 'ORDER_REGISTER':
      return OrderRegisterScreen();

    case 'GAME_PLAYING':
      return CoinFlipScreen();
    case 'LEE_SOON_SIN':
      return LeesoonsinScreen();
    default:
      return HomeScreen();
  }
}
