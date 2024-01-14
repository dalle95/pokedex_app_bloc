import 'package:flutter/material.dart';

import '/labels.dart';

class DownloadNuovaVersioneApp extends StatelessWidget {
  const DownloadNuovaVersioneApp({
    Key? key,
    required int percentuale,
  })  : _percentuale = percentuale,
        super(key: key);

  final int _percentuale;

  @override
  Widget build(BuildContext context) {
    String lableDownload =
        _percentuale == 0 ? labels.initDownload : labels.progressDownload;

    return Container(
      color: Theme.of(context).colorScheme.secondary,
      alignment: Alignment.center,
      child: SizedBox(
        width: 400,
        height: 300,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            labels.aggiornamentoApp,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          content: Container(
            alignment: Alignment.center,
            height: 100,
            width: 300,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          value: _percentuale / 100,
                          color: Theme.of(context).colorScheme.primary,
                          minHeight: 50,
                        ),
                      ),
                      Center(
                        child: Text(
                          '$_percentuale%',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_percentuale != 1)
                  Text(
                    lableDownload,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
