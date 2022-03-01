import 'package:flutter/material.dart';

import '../page/favourites_page.dart';
import '../page/data_channnels_page.dart';
import '../page/user_page.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const name = 'Sally Green';
    const email = 'sgreen@linz.govt.nz';
    const urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: ListView(
        children: <Widget>[
          buildHeader(
            urlImage: urlImage,
            name: name,
            email: email,
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const UserPage(
                name: 'Sarah Abs',
                urlImage: urlImage,
              ),
            )),
          ),
          Container(
            padding: padding,
            child: Column(
              children: [
                const SizedBox(height: 12),
                buildSearchField(context),
                const SizedBox(height: 24),
                buildMenuItem(
                  text: 'Data Channels',
                  icon: Icons.account_tree_outlined,
                  onClicked: () => selectedItem(context, 0),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Favourites',
                  icon: Icons.favorite_border,
                  onClicked: () => selectedItem(context, 1),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Workflow',
                  icon: Icons.workspaces_outline,
                  onClicked: () => selectedItem(context, 2),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Updates',
                  icon: Icons.update,
                  onClicked: () => selectedItem(context, 3),
                ),
                // const SizedBox(height: 24),
                // //    Divider(color: Colors.white70),
                // const SizedBox(height: 24),
                // buildMenuItem(
                //   text: 'Plugins',
                //   icon: Icons.account_tree_outlined,
                //   onClicked: () => selectedItem(context, 4),
                // ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Notifications',
                  icon: Icons.notifications_outlined,
                  onClicked: () => selectedItem(context, 5),
                ),
              ],
            ),
          ),
        ],
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
              const Spacer(),
              const CircleAvatar(
                radius: 24,
                //       backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child:
                    Icon(Icons.add_comment_outlined), //, color: Colors.white),
              )
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
