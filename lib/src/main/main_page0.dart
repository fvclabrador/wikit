import 'package:flutter/material.dart';
import 'package:wikit/src/main/wikit_item.dart';
import 'package:wikit/src/settings/settings_view.dart';

class MainPage0 extends StatelessWidget {
  const MainPage0({
    Key? key,
    this.items = const [
      // WikitItem("IAAS", ""),
      // WikitItem("PAAS", ""),
      // WikitItem("SAAS", "")
    ],
  }) : super(key: key);

  static const routeName = '/';

  final List<WikitItem> items;

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

        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.blue))),
                ),
                Expanded(
                    child: ListView.builder(
                  // Providing a restorationId allows the ListView to restore the
                  // scroll position when a user leaves and returns to the app after it
                  // has been killed while running in the background.
                  restorationId: 'sampleItemListView',
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = items[index];

                    return ListTile(
                        title: Text('${item.title} - ${item.description}'),
                        leading: const CircleAvatar(
                          foregroundImage:
                              AssetImage('assets/images/flutter_logo.png'),
                        ),
                        onTap: () {});
                  },
                ))
              ],
            )));
  }
}
