import 'package:bloc/bloc.dart';

import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_state.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class TicTacToeCubit extends Cubit<TicTacToeState> implements IGameListener {
  TicTacToeCubit()
      : super(TicTacToeState(
            mState: GameState.Playing, mTime: Duration.zero, mTimeX: Duration.zero, mTimeO: Duration.zero));

  IGame? g;

  void produce() {
    g = Game(true);
    g?.addListener(this);
  }

  void placePiece(Position p) {
    g!.placePiece(p);
  }

  void restart() {
    g!.restart();
  }

  bool isOver() {
    if (g!.isOver()) {
      return true;
    }
    return false;
  }

  @override
  void onGameOver(GameState gameState) {
    emit(state.copyWith(mState: gameState));
  }

  @override
  void onPiecePlaced(Position p, Piece piece) {
    emit(state.copyWith(mGameBoard: g?.gameBoard));
  }

  @override
  void onRestart() {
    emit(state.copyWith(mGameBoard: g?.gameBoard, mState: GameState.Playing, mTurn: g?.turn));
  }

  @override
  void onTimerChange(GameState gameState) {
    if (!isOver()) {
      emit(state.copyWith(mTime: g!.stopWatch.elapsed, mTimeX: g!.stopWatchX.elapsed, mTimeO: g!.stopWatchO.elapsed));
    }
  }

  void setDifficulty(Difficulty difficulty) {
    g?.strategy = (IStrategy.difficulty(difficulty));
  }

  Turn turn() => g!.turn;
}
