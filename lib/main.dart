import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/App/tic_tac_toe_app.dart';
import 'package:logger/logger.dart';

void main() {
  Logger.level = Level.off;
  runApp(const TicTacToe());
}
