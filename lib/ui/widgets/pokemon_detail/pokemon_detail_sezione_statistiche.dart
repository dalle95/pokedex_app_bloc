import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/labels.dart';

import '/data/models/pokemon_detail_model.dart';

class PokemonDetailSezioneStatistiche extends StatelessWidget {
  const PokemonDetailSezioneStatistiche({
    super.key,
    required this.pokemon,
  });

  final PokemonDetailModel? pokemon;

  @override
  Widget build(BuildContext context) {
    final int totalStats = int.parse(pokemon!.hp) +
        int.parse(pokemon!.defense) +
        int.parse(pokemon!.speed) +
        int.parse(pokemon!.specialDefense) +
        int.parse(pokemon!.specialAttack);
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            labels.pokemonDetailStatistiche,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 50),
          height: 250,
          child: RadarChart(
            RadarChartData(
              radarTouchData: RadarTouchData(
                enabled: true,
                touchSpotThreshold: 10,
              ),
              titleTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                  ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              gridBorderData: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                strokeAlign: 0,
                style: BorderStyle.solid,
              ),
              radarBorderData: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 3,
                style: BorderStyle.solid,
                strokeAlign: 1,
              ),
              radarShape: RadarShape.polygon,
              tickBorderData: const BorderSide(
                color: Colors.transparent,
              ),
              radarBackgroundColor: Colors.transparent,

              tickCount: 1,
              ticksTextStyle: const TextStyle(color: Colors.transparent),
              titlePositionPercentageOffset: 0.2,
              getTitle: (index, angle) {
                switch (index) {
                  case 0:
                    return RadarChartTitle(text: 'HP\n${pokemon!.hp}');
                  case 1:
                    return RadarChartTitle(text: 'ATK\n${pokemon!.attack}');
                  case 2:
                    return RadarChartTitle(text: 'DEF\n${pokemon!.defense}');
                  case 3:
                    return RadarChartTitle(text: 'SP\n${pokemon!.speed}');
                  case 4:
                    return RadarChartTitle(
                        text: 'SP.DEF\n${pokemon!.specialDefense}');
                  case 5:
                    return RadarChartTitle(
                        text: 'SP.ATK\n${pokemon!.specialAttack}');
                  default:
                    return const RadarChartTitle(text: '');
                }
              },
              dataSets: [
                RadarDataSet(
                  borderColor: pokemon!.mainTypeColor(),
                  fillColor: Color.lerp(
                    pokemon!.mainTypeColor(),
                    const Color.fromRGBO(255, 255, 255, 0),
                    0.4,
                  ),
                  dataEntries: [
                    RadarEntry(
                      value: double.parse(pokemon!.hp),
                    ),
                    RadarEntry(
                      value: double.parse(pokemon!.attack),
                    ),
                    RadarEntry(
                      value: double.parse(pokemon!.defense),
                    ),
                    RadarEntry(
                      value: double.parse(pokemon!.speed),
                    ),
                    RadarEntry(
                      value: double.parse(pokemon!.specialDefense),
                    ),
                    RadarEntry(
                      value: double.parse(pokemon!.specialAttack),
                    ),
                  ],
                ),
              ],
              // read about it in the RadarChartData section
            ),
            swapAnimationDuration:
                const Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            labels.pokemonDetailStatisticheTotali,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const Gap(10),
        Align(
          alignment: Alignment.center,
          child: Text(
            totalStats.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
