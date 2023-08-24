import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'listener.mocks.dart';

import 'package:tic_tac_toe_lib/src/game.dart';
import 'package:tic_tac_toe_lib/src/game_state.dart';
import 'package:tic_tac_toe_lib/src/igame_listener.dart';
import 'package:tic_tac_toe_lib/src/position.dart';

@GenerateNiceMocks([MockSpec<IGameListener>()])
void main() {
  test('When placePiece is called two times, then onPiecePlaces is called twice', () {
    Game g = Game.produce();
    var listenerMock = MockIGameListener();

    g.addListener(listenerMock);

    g.placePiece(Position(1, 0));
    g.placePiece(Position(0, 0));

    verify(listenerMock.onPiecePlaced(any, any)).called(2);

    g.removeListener(listenerMock);
  });

  test('When the last piece is placed, then the game ends', () {
    Game g = Game.produceFromString('x x o\nx x o\no o -\n');
    var listenerMock = MockIGameListener();

    g.addListener(listenerMock);

    g.placePiece(Position(2, 2));

    verify(listenerMock.onGameOver(GameState.Tie));

    g.removeListener(listenerMock);
  });

  test('When there are three crosses in a line, cross player wins', () {
    Game g = Game.produceFromString('x o o\no x o\n- o -\n');
    var listenerMock = MockIGameListener();

    g.addListener(listenerMock);

    g.placePiece(Position(2, 2));

    verify(listenerMock.onGameOver(GameState.CrossWon));

    g.removeListener(listenerMock);
  });

  test('When its tried to place a piece over another, then onPiecePlaces is never called', () {
    Game g = Game.produceFromString('x o o\no x o\n- o -\n');
    var listenerMock = MockIGameListener();

    g.addListener(listenerMock);

    g.placePiece(Position(0, 0));

    verifyNever(listenerMock.onPiecePlaced(any, any));

    g.removeListener(listenerMock);
  });

  test('When restart is called, onRestart is called', () {
    Game g = Game.produceFromString('x o o\no x o\n- o -\n');
    var listenerMock = MockIGameListener();

    g.addListener(listenerMock);

    g.restart();

    verify(listenerMock.onRestart());

    g.removeListener(listenerMock);
  });
}
