import 'package:flutter/material.dart';

class PokemonStatsItem extends StatelessWidget {
  final String statNome;
  final String statValore;
  final double statPercentuale;

  const PokemonStatsItem({
    required this.statNome,
    required this.statValore,
    required this.statPercentuale,
    super.key,
  });

  Color? statColor(String stat) {
    switch (stat) {
      case 'HP':
        return Colors.green;
      case 'Attacco':
        return Colors.yellow;
      case 'Difesa':
        return Colors.orange;
      case 'Attacco Speciale':
        return Colors.lightBlue;
      case 'Difesa Speciale':
        return Colors.purple;
      case 'Velocità':
        return Colors.pink;
      default:
        return Colors.black87;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 25,
      ),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 350 * (statPercentuale),
                    height: 30,
                    decoration: BoxDecoration(
                      color: statColor(statNome),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(2),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    child: Text(
                      '$statNome: $statValore',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
