import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class ConsoleClass extends IGameListener {
  ConsoleClass(Game givenGame, {this.toDisplay = '- - -\n- - -\n- - -\n'}) {
    currGame = givenGame;
  }

  Game? currGame;
  String toDisplay;

  void display() {
    print(toDisplay);
  }

  @override
  void onGameOver(GameState state) {
    switch (state) {
      case GameState.CrossWon:
        {
          print('X won!');
          break;
        }
      case GameState.ZeroWon:
        {
          print('O won!');
          break;
        }
      case GameState.Tie:
        {
          print('Tie!');
          break;
        }
      default:
        {
          print('Playing');
          break;
        }
    }
  }

  @override
  void onPiecePlaced(Position p, Piece piece) {
    int index = p.x * 6 + p.y * 2;
    String updatedString = '';

    if (piece == Piece.Cross) {
      updatedString = replaceCharAtIndex(toDisplay, index, 'x');
    } else if (piece == Piece.Zero) {
      updatedString = replaceCharAtIndex(toDisplay, index, 'o');
    }
    toDisplay = updatedString;

    print(toDisplay);
  }

  @override
  void onRestart() {
    toDisplay = '- - -\n- - -\n- - -\n';
    print('Game Restarted!');
    print(toDisplay);
  }

  @override
  void onTimerChange() {
    display();
    final timeLeft = currGame!.stopWatch;
    print(timeLeft.elapsed.inSeconds);
  }

  String replaceCharAtIndex(String original, int index, String newChar) {
    if (index < 0 || index >= original.length) {
      throw ArgumentError("Index out of bounds");
    }

    return original.substring(0, index) + newChar + original.substring(index + 1);
  }
}
