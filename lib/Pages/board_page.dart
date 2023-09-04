import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_flutter/Pages/difficulty_page.dart';
import 'package:tic_tac_toe_flutter/Widgets/big_card.dart';
import 'package:tic_tac_toe_flutter/Widgets/player_card.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_cubit.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_state.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class TicTacToeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.primaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.2),
              child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectDifficulty()));
                    context.read<TicTacToeCubit>().restart();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.2),
              child: IconButton(
                  icon: const Icon(
                    Icons.restart_alt,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.read<TicTacToeCubit>().restart();
                  }),
            ),
          ],
        ),
      ),
      backgroundColor: theme.primaryColorLight,
      body: Center(
        heightFactor: 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TurnDisplay(player: 'X'),
                    BlocBuilder<TicTacToeCubit, TicTacToeState>(
                      builder: (context, state) {
                        return Text(state.mTimeX.inSeconds.toString());
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TurnDisplay(player: 'O'),
                    BlocBuilder<TicTacToeCubit, TicTacToeState>(
                      builder: (context, state) {
                        return Text(state.mTimeO.inSeconds.toString());
                      },
                    ),
                  ],
                ),
              ],
            ),
            BlocBuilder<TicTacToeCubit, TicTacToeState>(
              builder: (context, state) {
                if (state.mState != GameState.Playing) {
                  String newText = state.mState.toString().replaceFirst('GameState.', '');
                  return Text(newText,
                      style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold, fontSize: 40));
                } else {
                  return const Text('',
                      style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold, fontSize: 40));
                }
              },
            ),
            SizedBox(height: 30),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: BlocBuilder<TicTacToeCubit, TicTacToeState>(
                builder: (context, state) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      final line = index ~/ 3;
                      final column = index % 3;
                      return Center(
                        child: ElevatedButton(
                            onPressed: () {
                              context.read<TicTacToeCubit>().placePiece(Position(line, column));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(),
                            ),
                            child: Builder(builder: (context) {
                              var letter = ' ';
                              if (state.mGameBoard == null) return Container();
                              if (state.mGameBoard![line][column] == Piece.Cross) letter = 'X';
                              if (state.mGameBoard![line][column] == Piece.Zero) letter = 'O';

                              return Text(
                                letter, // Display X or O here based on your game logic
                                style: const TextStyle(fontSize: 40),
                              );
                            })),
                      );
                    },
                    itemCount: 9,
                  );
                },
              ),
            ),
            Container(
              width: 300,
              height: 50,
              child: BlocBuilder<TicTacToeCubit, TicTacToeState>(
                builder: (context, state) {
                  return Center(
                      child:
                          Text(state.mTime.inSeconds.toString(), style: const TextStyle(fontWeight: FontWeight.bold)));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
