import 'package:tic_tac_toe_lib/src/GameExceptions/GameExceptions.dart';

class OutOfTableException extends GameException {
  OutOfTableException(super.message);
}
