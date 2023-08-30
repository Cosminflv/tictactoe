import 'package:bloc/bloc.dart';

import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_state.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class TicTacToeCubit extends Cubit<TicTacToeState> implements IGameListener {
  TicTacToeCubit() : super(TicTacToeState(mState: GameState.Playing));
  IGame g = IGame.produce();

  void placePiece(Position p) {
    g.placePiece(p);
  }

  @override
  void onGameOver(GameState gameState) {
    emit(TicTacToeState(mGameBoard: g.gameBoard, mState: gameState));
  }

  @override
  void onPiecePlaced(Position p, Piece piece) {
    emit(TicTacToeState(mGameBoard: g.gameBoard, mState: GameState.Playing));
  }

  @override
  void onRestart() {
    emit(TicTacToeState(mGameBoard: g.gameBoard, mState: GameState.Playing));
  }

  @override
  void onTimerChange() {
    // TODO: implement onTimerChange
  }
}
