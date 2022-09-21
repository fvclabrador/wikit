import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:wikit/src/main/wiki_category.dart';
import 'package:wikit/src/main/wikit_description_view.dart';
import 'package:wikit/src/main/wikit_item.dart';
import 'package:wikit/src/settings/settings_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<WikitItem> items = allItems;

  List<WikitCategory> categories = getCategory();

  String _categoryDropdownValue = "General";
  final _searchController = TextEditingController();

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
                DropdownButton(
                    hint: const Text("Categories"),
                    items: categories.map((item) {
                      return DropdownMenuItem(
                          child: Text(item.category), value: item.category);
                    }).toList(),
                    iconSize: 42.0,
                    iconEnabledColor: Colors.green,
                    isExpanded: true,
                    value: _categoryDropdownValue,
                    onChanged: selectCategory),
                TextField(
                  controller: _searchController,
                  onChanged: searchWikit,
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
                  //restorationId: 'sampleItemListView',
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = items[index];

                    return ListTile(
                        title: Text(
                            '${item.category} - ${item.title} - ${item.description}'),
                        leading: const CircleAvatar(
                          foregroundImage:
                              AssetImage('assets/images/flutter_logo.png'),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WikitDescriptionView(
                                      title: item.title,
                                      description: item.description)));
                        });
                  },
                ))
              ],
            )));
  }

  static List<WikitCategory> getCategory() {
    return allCategories2.map(WikitCategory.fromJson).toList();
  }

  void selectCategory(String? selectedValue) {
    setState(() {
      _categoryDropdownValue = selectedValue!;
    });
    sortWikit(selectedValue!);
  }

  void sortWikit(String query) {
    final suggestions = allItems.where((wikit) {
      final data = wikit.category.toLowerCase();
      final input = query.toLowerCase();

      return data.contains(input);
    }).toList();

    setState(() => items = suggestions);
  }

  void searchWikit(String query) {
    final suggestions = allItems.where((wikit) {
      final data = wikit.title.toLowerCase();
      final input = query.toLowerCase();

      return data.contains(input);
    }).toList();

    setState(() => items = suggestions);
  }
}
