import 'package:flutter/material.dart';
import 'package:metcat/src/forms/aerial_photo_form.dart';
import 'package:metcat/src/manage/main_manage_menu.dart';

class ManagePage extends StatelessWidget {
  const ManagePage(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      MainManageMenu(context),
      Expanded(child: HistoricalImageryForm(context)) // DataOverview())
    ]);
  }
}
