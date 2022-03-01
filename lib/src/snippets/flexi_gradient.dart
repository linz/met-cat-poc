import 'package:flutter/material.dart';

class FlexiGradient extends StatelessWidget {
  const FlexiGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;
    Color secondary = Theme.of(context).colorScheme.primaryContainer;
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft, end: Alignment.bottomRight,
                // transform: GradientRotation(0.3),
                colors: <Color>[primary, secondary])));
  }
}

//colors: <Color>[Color(0x0000425d), Color(0x00007097)])));

