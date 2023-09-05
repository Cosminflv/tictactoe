import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_cubit.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_state.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class CircleProgress extends StatelessWidget {
  const CircleProgress({
    super.key,
    this.player,
  });

  final Turn? player;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicTacToeCubit, TicTacToeState>(
      builder: (context, state) {
        if (state.mTurn == player) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              value: state.mTimeLimited!.inMilliseconds / 10000,
              color: Theme.of(context).primaryColor,
              backgroundColor: Colors.cyan.shade50,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              value: 0.0,
              backgroundColor: Colors.cyan.shade50,
            ),
          );
        }
      },
    );
  }
}
