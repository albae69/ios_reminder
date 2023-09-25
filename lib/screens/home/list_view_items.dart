import 'package:flutter/material.dart';
import 'package:ios_reminder/models/category_collection.dart';

const LIST_VIEW_HEIGHT = 70.0;

class ListViewItems extends StatefulWidget {
  final CategoryCollection categoryCollection;

  const ListViewItems({required this.categoryCollection});

  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.categoryCollection.categories.length * LIST_VIEW_HEIGHT + LIST_VIEW_HEIGHT,
      child: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }

          final item = widget.categoryCollection.removeItem(oldIndex);
          setState(() {
            widget.categoryCollection.insert(newIndex, item);
          });
        },
        children: widget.categoryCollection.categories
            .map(
              (category) => SizedBox(
                height: LIST_VIEW_HEIGHT,
                key: UniqueKey(),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      category.toggleCheckbox();
                    });
                  },
                  tileColor: Colors.grey[800],
                  leading: Container(
                    child: Icon(Icons.check,
                        color: category.isChecked!
                            ? Colors.white
                            : Colors.transparent),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: category.isChecked!
                                ? Colors.blueAccent
                                : Colors.transparent),
                        shape: BoxShape.circle,
                        color: category.isChecked!
                            ? Colors.blueAccent
                            : Colors.transparent),
                  ),
                  title: Row(
                    children: [
                      category.icon,
                      const SizedBox(width: 10),
                      Text(category.name),
                    ],
                  ),
                  trailing: Icon(Icons.reorder),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
