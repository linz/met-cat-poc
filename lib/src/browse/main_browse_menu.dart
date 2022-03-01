import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:metcat/src/widget/button.dart';

import '../page/favourites_page.dart';
import '../page/data_channnels_page.dart';

class MainBrowseMenu extends StatelessWidget {
  const MainBrowseMenu(BuildContext context, {Key? key}) : super(key: key);

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
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Favourites',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'New Releases',
                    icon: Icons.notifications_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Category',
                    icon: Icons.workspaces_outline,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Group',
                    icon: Icons.group_outlined,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Data Type',
                    icon: Icons.image_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Source',
                    icon: Icons.source_outlined,
                    onClicked: () => selectedItem(context, 5),
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
