import 'package:flutter/material.dart';

import '../page/favourites_page.dart';
import '../page/data_channnels_page.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                height: 80,
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Image.asset(
                    'assets/images/linz_logo.png',
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              buildMenuItem(
                text: 'Catalogue',
                icon: Icons.library_books_outlined,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Hydro',
                icon: Icons.waves_outlined,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Topo',
                icon: Icons.map_outlined,
                onClicked: () => selectedItem(context, 2),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Positioning',
                icon: Icons.location_searching_outlined,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Resilience',
                icon: Icons.local_police_outlined,
                onClicked: () => selectedItem(context, 5),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSearchField(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary; // Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      contentPadding: padding,
      leading: Icon(icon),
      title: Text(text),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DataChannelsPage(context),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const FavouritesPage(),
        ));
        break;
    }
  }
}
