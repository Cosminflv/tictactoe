import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/Pages/board_page.dart';
import 'package:tic_tac_toe_flutter/Widgets/big_card.dart';

class SelectDifficulty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<InitialState>();
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      body: Center(
        heightFactor: 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              //height: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Difficulty',
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Quicksand', fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CenteredButton(
                  text: 'Easy',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TicTacToeLayout()));
                  },
                ),
                SizedBox(height: 10),
                CenteredButton(
                  text: 'Medium',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TicTacToeLayout()));
                  },
                ),
                SizedBox(height: 10),
                CenteredButton(
                  text: 'Hard',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TicTacToeLayout()));
                  },
                ),
                SizedBox(height: 10),
                CenteredButton(
                  text: 'Player vs player',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
