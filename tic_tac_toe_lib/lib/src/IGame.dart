import 'package:tic_tac_toe_lib/src/Strategy/IStrategy.dart';
import 'package:tic_tac_toe_lib/src/igame_listener.dart';
import 'package:tic_tac_toe_lib/src/position.dart';
import 'package:tic_tac_toe_lib/src/piece.dart';

abstract class IGame {
  void placePiece(Position p);
  void restart();
  Piece? at(Position p);
  void addListener(IGameListener listener);
  void removeListener(IGameListener listener);

  set strategy(IStrategy strategy);
}
