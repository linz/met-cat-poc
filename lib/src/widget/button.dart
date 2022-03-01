import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const Button({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        //    style: ElevatedButton.styleFrom(
        //      minimumSize: const Size.fromHeight(50),
        //    ),
        child: Row(
          //   mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 22),
            Text(
              text,
              //          style:
              //             TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ],
        ),
        onPressed: onClicked,
      );

  // Widget buildContent() =>
}
