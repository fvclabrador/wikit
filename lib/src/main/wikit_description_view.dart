import 'package:flutter/material.dart';
import 'package:wikit/src/settings/settings_view.dart';

class WikitDescriptionView extends StatelessWidget {
  const WikitDescriptionView(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wikit'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  title + " - " + description,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )));
  }
}
