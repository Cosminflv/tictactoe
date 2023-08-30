import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/Pages/difficulty_page.dart';

class TicTacToeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.primaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.2),
              child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectDifficulty()));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.2),
              child: IconButton(
                  icon: const Icon(
                    Icons.restart_alt,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ),
          ],
        ),
      ),
      backgroundColor: theme.primaryColorLight,
      body: Center(
        heightFactor: 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Do something when the button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(),
                      ),
                      child: const Text(
                        'X', // Display X or O here based on your game logic
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  );
                },
                itemCount: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
