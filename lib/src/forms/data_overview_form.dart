import 'package:flutter/material.dart';

class DataOverview extends StatefulWidget {
  const DataOverview({Key? key}) : super(key: key);

  @override
  State<DataOverview> createState() => _DataOverviewState();
}

class _DataOverviewState extends State<DataOverview> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final formKey = GlobalKey<FormState>();
  String core_title = '';
  String core_description = '';

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildTitle(),
            const SizedBox(height: 16),
            buildDescription(),
            const SizedBox(height: 16),
            buildPurpose(),
            const SizedBox(height: 32),
            buildSubmit(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Dataset Title',
          hintText: 'The name by which the dataset is known.',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 5) {
            return 'Please provide a title of at least 5 characters';
          } else {
            return null;
          }
        },
        maxLength: 65,
        onSaved: (value) => setState(() => core_title = value!),
      );

  Widget buildDescription() => TextFormField(
        decoration: const InputDecoration(
          hintText:
              'This will help inform users what information is contained in the dataset',
          labelText: 'Dataset Description',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 100) {
            return 'Please provide an informative description of at least 100 characters.';
          } else {
            return null;
          }
        },
        maxLength: 850,
        minLines: 1,
        maxLines: 8,
        keyboardType: TextInputType.multiline,
        onSaved: (value) => setState(() => core_description = value!),
      );

  Widget buildPurpose() => TextFormField(
        // keyboardType: TextInputType.none,
        decoration: const InputDecoration(
          labelText: 'Dataset Purpose',
          alignLabelWithHint: true,
          hintText:
              'Description of the purpose of the dataset to help a customer evaluate the suitability of a dataset.',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 100) {
            return 'Please provide an informative purpose of at least 100 characters';
          } else {
            return null;
          }
        },
        maxLength: 850,
        minLines: 1,
        maxLines: 8,
        keyboardType: TextInputType.multiline,
      );

  Widget buildDataManager() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Dataset Manager',
          hintText: 'The LINZ (internal) Data Manager for the dataset.',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 5) {
            return 'Please provide a title of at least 5 characters';
          } else {
            return null;
          }
        },
        maxLength: 65,
      );

  Widget buildEmail() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
          final regExp = RegExp(pattern);

          if (value == null || value.isEmpty) {
            return 'Enter an email';
          } else if (!regExp.hasMatch(value)) {
            return 'Enter a valid email';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        //    onSaved: (value) => setState(() => email = value),
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () {
            final isValid = formKey.currentState?.validate();
            // FocusScope.of(context).unfocus();

            if (isValid != null || isValid!) {
              formKey.currentState?.save();

              final message =
                  'Title: $core_title\nDescription: $core_description';
              final snackBar = SnackBar(
                content: Text(
                  message,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
        // shape: StadiumBorder(),
        // color: Theme.of(context).primaryColor,
        // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // textColor: Colors.white,
        onPressed: onClicked,
      );
}
