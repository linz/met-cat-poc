import 'package:flutter/material.dart';
import 'package:metcat/src/forms/data_overview_form.dart';

class HistoricalImageryForm extends StatelessWidget {
  const HistoricalImageryForm(BuildContext context, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          title: const Text('Historical Imagery'),
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.onSurface,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0),
              //   //  insets: EdgeInsets.symmetric(horizontal: 60.0)
            ),
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.map_outlined),
              ),
              Tab(
                icon: Icon(Icons.add_location_alt_outlined),
              ),
              Tab(
                icon: Icon(Icons.select_all_outlined),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: DataOverview(),
            ),
            Center(
              child: Text("Dataet Details"),
            ),
            Center(
              child: Text("View and manage dataset outline"),
            ),
          ],
        ),
      ),
    );
  }
}
