import 'package:tic_tac_toe_lib/src/igame_listener.dart';
import 'package:tic_tac_toe_lib/src/position.dart';

abstract class IGame {
  void placePiece(Position p);
  void restart();
  void addListener(IGameListener listener);
  void removeListener(IGameListener listener);
}
