import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_flutter/Pages/difficulty_page.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_cubit.dart';

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TicTacToeCubit(),
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
