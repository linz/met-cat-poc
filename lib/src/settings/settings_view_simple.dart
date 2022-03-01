import 'package:flutter/material.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsViewSimple extends StatelessWidget {
  const SettingsViewSimple({Key? key, required this.controller})
      : super(key: key);

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    // FIXME  This drop down button is not always refreshing on select. Maybe out this video at some point to see if a PopupMenuButton (vs dropdown) is not better.
    return DropdownButton<ThemeMode>(
      // Read the selected themeMode from the controller
      value: controller.themeMode,
      // Call the updateThemeMode method any time the user selects a theme.
      onChanged: controller.updateThemeMode,
      //style: Theme.of(context).textTheme.bodyMedium,
      items: const [
        DropdownMenuItem(
          value: ThemeMode.system,
          child: Text('System Theme'),
        ),
        DropdownMenuItem(
          value: ThemeMode.light,
          child: Text('Light Theme'),
        ),
        DropdownMenuItem(
          value: ThemeMode.dark,
          child: Text('Dark Theme'),
        )
      ],
    );
  }
}
