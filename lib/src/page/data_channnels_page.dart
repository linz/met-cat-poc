import 'package:flutter/material.dart';

class DataChannelsPage extends StatelessWidget {
  const DataChannelsPage(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Data Channels'),
          centerTitle: true,
        ),
      );
}
