import 'package:flutter/material.dart';

import '/labels.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          labels.homepageTitolo,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          labels.homepageTitolo,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontFamily: 'Pokemon Main hollow',
                color: const Color.fromRGBO(55, 97, 168, 1),
              ),
        ),
      ],
    );
  }
}
