import 'package:bloc/bloc.dart';

import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_state.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class TicTacToeCubit extends Cubit<TicTacToeState> implements IGameListener {
  TicTacToeCubit()
      : super(TicTacToeState(mState: GameState.Playing, mTime: Duration.zero, mTimeLimited: Duration.zero));

  IGame? g;

  void produce({bool? wantTimer}) {
    g = Game(wantTimer: wantTimer);
    g?.addListener(this);
  }

  void setGame(IGame newGame) {
    g = newGame;
    g!.addListener(this);
  }

  void stopGame() {
    g!.stopWatchLimited.stop();
  }

  void placePiece(Position p) {
    g!.placePiece(p);
  }

  void restart() {
    g!.restart();
  }

  bool isOver() {
    return g!.isOver();
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
    emit(state.copyWith(
        mGameBoard: g?.gameBoard,
        mState: GameState.Playing,
        mTurn: g?.turn,
        mTime: Duration.zero,
        mTimeLimited: Duration.zero));
  }

  void setDifficulty(Difficulty difficulty) {
    g?.strategy = (IStrategy.difficulty(difficulty));
  }

  Turn turn() => g!.turn;

  @override
  void onTimerChange() {
    if (!isOver()) {
      emit(state.copyWith(mTime: g!.stopWatchElapsed, mTimeLimited: g!.stopWatchLimitedElapsed));
    }
  }

  @override
  void onSwitchTurn(Turn turn) {
    emit(state.copyWith(mTurn: turn, mTimeLimited: g!.stopWatchLimitedElapsed));
  }
}
