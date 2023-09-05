import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_cubit.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_state.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

import 'mock_generator.mocks.dart';

void main() {
  blocTest<TicTacToeCubit, TicTacToeState>(
    'emits [MyState] when MyEvent is added.',
    build: () => TicTacToeCubit(),
    act: (bloc) {
      MockIGame mockedGame = MockIGame();
      bloc.setGame(mockedGame);
      bloc.placePiece(Position(0, 0));

      verify(mockedGame.placePiece(Position(0, 0)));
    },
    expect: () => const [],
  );

  blocTest<TicTacToeCubit, TicTacToeState>(
    'emits [MyState] when MyEvent is added.',
    build: () => TicTacToeCubit(),
    act: (cubit) {
      MockIGame mockedGame = MockIGame();
      cubit.setGame(mockedGame);

      when(mockedGame.isOver()).thenReturn(false);
      when(mockedGame.stopWatchElapsed).thenReturn(const Duration(seconds: 5));
      when(mockedGame.stopWatchLimitedElapsed).thenReturn(const Duration(seconds: 5));
      cubit.onTimerChange();
    },
    expect: () => [
      TicTacToeState(
          mTime: const Duration(seconds: 5), mState: GameState.Playing, mTimeLimited: const Duration(seconds: 5))
    ],
  );
}
