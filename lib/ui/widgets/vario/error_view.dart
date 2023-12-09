import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ErrorViev extends StatelessWidget {
  const ErrorViev({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 50),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/pokeball_cambia_tipo.gif'),
              ),
              const Gap(20),
              const Text('Qualcosa è andato storto'),
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
}
