import 'package:flutter/material.dart';

class WinnerDisplay extends StatelessWidget {
  final String winner;
  final bool rowBuilderWins;

  const WinnerDisplay(
      {Key? key, required this.winner, required this.rowBuilderWins})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: winner.isNotEmpty,
      child: winner.isNotEmpty
          ? Container(
              width: 280,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Winner: ',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (winner == 'x')
                    rowBuilderWins
                        ? const Icon(
                            Icons.close,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            color: Colors.white,
                          )
                  else if (winner == 'o')
                    rowBuilderWins
                        ? const Icon(
                            Icons.circle_outlined,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.close,
                            color: Colors.white,
                          )
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
