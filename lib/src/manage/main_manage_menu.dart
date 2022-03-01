import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:metcat/src/widget/button.dart';

import '../page/favourites_page.dart';
import '../page/data_channnels_page.dart';

class MainManageMenu extends StatelessWidget {
  const MainManageMenu(BuildContext context, {Key? key}) : super(key: key);

  static const padding = EdgeInsets.symmetric(horizontal: 10);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          children: <Widget>[
            Container(
              padding: padding,
              child: Column(
                children: [
                  // const SizedBox(height: 12),
                  // buildSearchField(context),

                  const SizedBox(
                    height: 15,
                  ),
                  //SizedBox(
                  // height: 30,
                  Button(
                    icon: Icons.add,
                    text: 'New Dataset',
                    onClicked: () => log('sleep'),
                  ),

                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'My Datasets',
                    icon: Icons.person_outline_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Recent Updates',
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Data Sources',
                    icon: Icons.account_tree_outlined,
                    onClicked: () => selectedItem(context, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    //             style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    //          style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              // Spacer(),
              // CircleAvatar(
              //   radius: 24,
              //   //       backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              //   child:
              //       Icon(Icons.add_comment_outlined), //, color: Colors.white),
              // )
            ],
          ),
        ),
      );

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

  // Widget buildMenuItem({
  //   required String text,
  //   required IconData icon,
  //   VoidCallback? onClicked,
  // }) {
  //   final color = Colors.white;
  //   final hoverColor = Colors.white70;

  //   return ListTile(
  //     leading: Icon(icon, color: color),
  //     title: Text(text, style: TextStyle(color: color)),
  //     hoverColor: hoverColor,
  //     onTap: onClicked,
  //   );
  // }
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
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
