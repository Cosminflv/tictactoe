import 'package:equatable/equatable.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

// ignore: must_be_immutable
class TicTacToeState {
  List<List<Piece?>>? mGameBoard;
  final GameState mState;
  final Turn? mTurn;
  final Duration mTime;

  @override
  // TODO: implement props
  //List<Object?> get props => [mGameBoard, mState, mTurn];

  TicTacToeState({this.mGameBoard, this.mTurn, required this.mTime, required this.mState}) {
    mGameBoard = mGameBoard;
  }

  TicTacToeState copyWith({List<List<Piece?>>? mGameBoard, GameState? mState, Turn? mTurn, Duration? mTime}) =>
      TicTacToeState(
          mGameBoard: mGameBoard ?? this.mGameBoard,
          mState: mState ?? this.mState,
          mTurn: mTurn ?? this.mTurn,
          mTime: mTime ?? this.mTime);

  //emit(state.copyWith(mBoardBoard/mState))
  //to update a specific state
}
