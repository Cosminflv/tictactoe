import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_flutter/App/initial_app_state.dart';
import 'package:tic_tac_toe_flutter/Pages/board_page.dart';
import 'package:tic_tac_toe_flutter/Pages/difficulty_page.dart';

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InitialState(),
      child: MaterialApp(
        title: 'Tic Tac Toe',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent.shade400),
        ),
        home: SelectDifficulty(),
      ),
    );
  }
}
