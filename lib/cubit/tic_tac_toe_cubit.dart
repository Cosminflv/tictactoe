import 'package:bloc/bloc.dart';

import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_state.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class TicTacToeCubit extends Cubit<TicTacToeState> implements IGameListener {
  TicTacToeCubit() : super(TicTacToeState(mState: GameState.Playing));

  IGame? g;

  void produce() {
    g = Game();
    g?.addListener(this);
  }

  void placePiece(Position p) {
    g!.placePiece(p);
  }

  void restart() {
    g!.restart();
  }

  @override
  void onGameOver(GameState gameState) {
    emit(TicTacToeState(mGameBoard: g?.gameBoard, mState: gameState));
  }

  @override
  void onPiecePlaced(Position p, Piece piece) {
    emit(TicTacToeState(mGameBoard: g?.gameBoard, mState: GameState.Playing, mTurn: g?.turn));
  }

  @override
  void onRestart() {
    emit(TicTacToeState(mGameBoard: g?.gameBoard, mState: GameState.Playing, mTurn: g?.turn));
  }

  @override
  void onTimerChange() {
    // TODO: implement onTimerChange
  }

  void setDifficulty(Difficulty difficulty) {
    g?.strategy = (IStrategy.difficulty(difficulty));
  }

  Turn turn() => g!.turn;
}
