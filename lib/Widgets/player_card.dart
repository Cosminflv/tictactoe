import 'package:flutter/material.dart';

class TurnDisplay extends StatelessWidget {
  final String player;

  const TurnDisplay({
    required this.player,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(player,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
