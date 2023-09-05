import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_flutter/Pages/board_page.dart';
import 'package:tic_tac_toe_flutter/Widgets/big_card.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_cubit.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class SelectDifficulty extends StatelessWidget {
  //const SelectDifficulty(Key? key) : super(key: key);

  Widget createCenteredButton(BuildContext context, Difficulty? difficulty) {
    return CenteredButton(
        text: difficulty == null ? "Player vs player" : difficulty.toString(),
        onPressed: () {
          context.read<TicTacToeCubit>().produce(wantTimer: true);
          context.read<TicTacToeCubit>().restart();
          context.read<TicTacToeCubit>().onRestart();
          if (difficulty != null) context.read<TicTacToeCubit>().setDifficulty(difficulty);
          Navigator.push(context, MaterialPageRoute(builder: (context) => TicTacToeLayout()));
        });
  }

  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<InitialState>();
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      body: Center(
        heightFactor: 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              //height: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Difficulty',
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Quicksand', fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createCenteredButton(context, Difficulty.easy),
                const SizedBox(height: 10),
                createCenteredButton(context, Difficulty.medium),
                const SizedBox(height: 10),
                createCenteredButton(context, Difficulty.hard),
                const SizedBox(height: 10),
                createCenteredButton(context, null),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
