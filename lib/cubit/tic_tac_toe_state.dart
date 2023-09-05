import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

// ignore: must_be_immutable
class TicTacToeState {
  //fields
  List<List<Piece?>>? mGameBoard;
  final GameState mState;
  final Turn? mTurn;
  final Duration mTime;
  final Duration mTimeLimited;

  @override
  // TODO: implement props
  //List<Object?> get props => [mGameBoard, mState, mTurn];

  TicTacToeState({this.mGameBoard, this.mTurn, required this.mTime, required this.mState, required this.mTimeLimited}) {
    mGameBoard = mGameBoard;
  }

  TicTacToeState copyWith(
          {List<List<Piece?>>? mGameBoard, GameState? mState, Turn? mTurn, Duration? mTime, Duration? mTimeLimited}) =>
      TicTacToeState(
          mGameBoard: mGameBoard ?? this.mGameBoard,
          mState: mState ?? this.mState,
          mTurn: mTurn ?? this.mTurn,
          mTime: mTime ?? this.mTime,
          mTimeLimited: mTimeLimited ?? this.mTimeLimited);

  //emit(state.copyWith(mBoardBoard/mState))
  //to update a specific state
}
