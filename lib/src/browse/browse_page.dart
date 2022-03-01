import 'package:flutter/material.dart';
import 'package:metcat/src/browse/search_page.dart';

import 'map_page.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   return Row(
    //       children: <Widget>[MainBrowseMenu(context), SearchPage(context)]);
    // }
    return Row(
      children: <Widget>[
        SizedBox(child: SearchPage(context), width: 300),
        Expanded(child: MapPage(context)),
      ],
    );
  }
}
