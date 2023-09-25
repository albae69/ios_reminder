import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminder/models/category_collection.dart';
import 'package:ios_reminder/screens/home/footer.dart';
import 'package:ios_reminder/screens/home/grid_view_items.dart';
import 'package:ios_reminder/screens/home/list_view_items.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryCollection categoryCollection = CategoryCollection();

  String layoutType = "grid";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (layoutType == 'grid') {
                setState(() {
                  layoutType = 'list';
                });
              } else {
                setState(() {
                  layoutType = 'grid';
                });
              }
            },
            child: Text(
              layoutType == 'grid' ? 'Edit' : "Done",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child:
              AnimatedCrossFade(
                duration: Duration(milliseconds: 300),
                crossFadeState: layoutType == 'grid'
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: GridViewItems(
                    categories: categoryCollection.selectedCategories),
                secondChild: ListViewItems(
                    categoryCollection: categoryCollection),
              ),
          ),
              Footer()
        ],
      ),
    );
  }
}
