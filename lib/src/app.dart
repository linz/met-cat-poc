import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:metcat/src/browse/browse_page.dart';
import 'package:metcat/src/manage/manage_page.dart';
import 'package:metcat/src/settings/metcat_theme.dart';
import 'package:metcat/src/settings/settings_view_simple.dart';

import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',
            debugShowCheckedModeBanner: false,

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: MetCatTheme.light(),
            darkTheme: MetCatTheme.dark(),
            themeMode: settingsController.themeMode,
            home: HomeLayout(settingsController: settingsController));
      },
    );
  }
}

class HomeLayout extends StatefulWidget {
  const HomeLayout({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Navigation Drawer was part of a PoC, but not used at this point.
      // drawer: NavigationDrawer(),

      appBar: AppBar(title: const Text('MetCat'),
          // flexibleSpace: const FlexiGradient(),
          actions: [
            // Refactor as menu grows. https://www.youtube.com/watch?v=TczSxNJB1gU
            PopupMenuButton<int>(
                icon: const Icon(Icons.person),
                itemBuilder: (controller) => [
                      const PopupMenuItem(
                        child: Text('User Preferences'),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem(
                          child: Row(children: [
                        Icon(
                          Icons.light_mode,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(width: 8),
                        SettingsViewSimple(
                            controller: widget.settingsController)
                      ])),
                    ]),
          ]),

      body: Row(
        children: <Widget>[
          SizedBox(
            width: 50,
            child: NavigationRail(
              backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              // labelType: NavigationRailLabelType.selected,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.library_books_outlined),
                  selectedIcon: Icon(Icons.library_books, size: 32),
                  label: Text('Browse'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.library_add_outlined),
                  selectedIcon: Icon(Icons.library_add, size: 35),
                  label: Text('Manage'),
                ),
              ],
            ),
          ),
          //   _selectedIndex > 0 ? MainMenu(context) : MainMenu(context),
          //      Expanded(child: AerialPhotoView(context)) // DataOverview())
          Expanded(child: buildPages(context)),
          //        DataChannelsPage(context),
        ],
      ),
    );
  }

  Widget buildPages(BuildContext context) {
    switch (_selectedIndex) {
      case 1:
        return ManagePage(context);
      default:
        return BrowsePage(context);
    }
  }
}
