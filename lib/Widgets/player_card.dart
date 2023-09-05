import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_cubit.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_state.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class TurnDisplay extends StatelessWidget {
  final String player;

  const TurnDisplay({
    required this.player,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 50,
      child: BlocBuilder<TicTacToeCubit, TicTacToeState>(
        builder: (context, state) {
          if (player == 'X' && state.mTurn == Turn.crossTurn || player == 'O' && state.mTurn == Turn.zeroTurn) {
            return Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.cyan.shade50, width: 5)),
              child: Center(
                child: Text(player,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    )),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(player,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    )),
              ),
            );
          }
        },
      ),
    );
  }
}
