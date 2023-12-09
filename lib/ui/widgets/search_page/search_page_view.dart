import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/labels.dart';

import '/screens/homepage.dart';

import 'dropdown_button.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({
    required this.tipi,
    required this.pokedex,
    required this.generazioni,
    super.key,
  });

  //final TextEditingController nomePokemon;
  final List<String> tipi;
  final List<String> pokedex;
  final List<String> generazioni;

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTipi = TextEditingController(text: '');
    TextEditingController controllerPokedex = TextEditingController(text: '');
    TextEditingController controllerGenerazioni =
        TextEditingController(text: '');
    return Container(
      padding: const EdgeInsets.only(
        top: 50,
        left: 20,
        right: 20,
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      labels.searchPageTipo,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    child: DropDownButton(
                      controller: controllerTipi,
                      controllerParametro1: controllerPokedex,
                      controllerParametro2: controllerGenerazioni,
                      list: tipi,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      labels.searchPagePokedex,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const Gap(20),
                  Container(
                    alignment: Alignment.center,
                    child: DropDownButton(
                      controller: controllerPokedex,
                      controllerParametro1: controllerTipi,
                      controllerParametro2: controllerGenerazioni,
                      list: pokedex,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      labels.searchPageGenerazione,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const Gap(20),
                  DropDownButton(
                    controller: controllerGenerazioni,
                    controllerParametro1: controllerTipi,
                    controllerParametro2: controllerPokedex,
                    list: generazioni,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => _estraiParametro(
                  context,
                  controllerTipi,
                  controllerPokedex,
                  controllerGenerazioni,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primary,
                  ),
                  elevation: const MaterialStatePropertyAll(10),
                  minimumSize: const MaterialStatePropertyAll(
                    Size(200, 50),
                  ),
                ),
                child: Text(
                  labels.searchPageCerca,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Funzione per estrarre il parametro compilato dai 3 controller
  void _estraiParametro(
      BuildContext context,
      TextEditingController controllerTipi,
      TextEditingController controllerPokedex,
      TextEditingController controllerGenerazioni) {
    if (controllerTipi.text != '' ||
        controllerPokedex.text != '' ||
        controllerGenerazioni.text != '') {
      if (controllerTipi.text != '') {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(
          context,
          HomePage.routeName,
          arguments: {
            'categoria': 'tipo',
            'id': controllerTipi.text,
          },
        );
      }
      if (controllerPokedex.text != '') {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(
          context,
          HomePage.routeName,
          arguments: {
            'categoria': 'pokedex',
            'id': controllerPokedex.text,
          },
        );
      }
      if (controllerGenerazioni.text != '') {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(
          context,
          HomePage.routeName,
          arguments: {
            'categoria': 'generazione',
            'id': controllerGenerazioni.text,
          },
        );
      }
    } else {
      Navigator.pop(context);
      Navigator.pushReplacementNamed(
        context,
        HomePage.routeName,
        arguments: {
          'categoria': 'pokemon',
          'id': '',
        },
      );
    }
  }
}
