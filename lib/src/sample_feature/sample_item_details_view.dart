import 'package:flutter/material.dart';

import '../snippets/flexi_gradient.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({Key? key}) : super(key: key);

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        flexibleSpace: const FlexiGradient(),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
