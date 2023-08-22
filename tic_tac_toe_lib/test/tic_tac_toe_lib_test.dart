import 'package:tic_tac_toe_lib/src/Board.dart';
import 'package:tic_tac_toe_lib/src/GameExceptions/CannotPlaceException.dart';
import 'package:tic_tac_toe_lib/src/GameExceptions/OutOfTableException.dart';
import 'package:tic_tac_toe_lib/src/Piece.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';
import 'package:test/test.dart';

void main() {
  group('Group of BoardTests', () {
    test('Row full of crosses', () {
      final boardTest = Board.fromDisplayString('x x x\n- o o\no - -\n');
      expect(boardTest.checkRow(0, Piece.Cross), true);
    });

    test('Column full of zeros', () {
      final boardTest = Board.fromDisplayString('x o x\n- o x\n- o -\n');
      expect(boardTest.checkColumn(1, Piece.Zero), true);
    });

    test('False column of crosses', () {
      final boardTest = Board.fromDisplayString('x o x\n- o x\n- o -\n');
      expect(boardTest.checkColumn(0, Piece.Cross), false);
    });

    test('Primary diagonal full of crosses', () {
      final boardTest = Board.fromDisplayString('x o x\n- x o\no - x\n');
      expect(boardTest.checkPrimaryDiagonal(Piece.Cross), true);
    });

    test('Secondary diagonal full of zeros', () {
      final boardTest = Board.fromDisplayString('o x o\n- o x\no - x\n');
      expect(boardTest.checkSecondaryDiagonal(Piece.Zero), true);
    });

    test('Place piece test1', () {
      final boardTest = Board();
      boardTest.placePiece(Position(0, 0), Piece.Cross);
      expect(boardTest.at(Position(0, 0)), Piece.Cross);
    });
  });

  group('Group of placePiece Tests', () {
    Game g = Game();

    // setUp(() {
    //    Additional setup goes here.
    // });

    test('Piece placed correctly', () {
      g.placePiece(Position(0, 0));
      g.placePiece(Position(1, 1));
      expect(g.pieceType(Position(0, 0)), Piece.Cross);
      expect(g.pieceType(Position(1, 1)), Piece.Zero);
    });

    test('Piece cannot pe placed over an existing piece', () {
      g.placePiece(Position(2, 2));
      expect(g.pieceType(Position(2, 2)), Piece.Cross);
      g.placePiece(Position(2, 2));
      expect(g.pieceType(Position(2, 2)), Piece.Cross);
    });
  });
}
