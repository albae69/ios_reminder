import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminder/models/category.dart';
import 'package:ios_reminder/widgets/category_icon.dart';

class CategoryCollection {
  final List<Category> _categories = [
    Category(
        id: 'today',
        name: 'Today',
        icon: CategoryIcon(
          color: CupertinoColors.systemBlue,
          iconData: CupertinoIcons.calendar_today,
        )),
    Category(
        id: 'scheduled',
        name: 'Scheduled',
        icon: CategoryIcon(
            color: CupertinoColors.systemRed, iconData: Icons.inbox_rounded)),
    Category(
        id: 'all',
        name: 'All',
        icon: CategoryIcon(
          color: CupertinoColors.systemGrey,
          iconData: CupertinoIcons.calendar,
        )),
    Category(
        id: 'flagged',
        name: 'Flagged',
        icon: CategoryIcon(
            color: CupertinoColors.activeOrange,
            iconData: CupertinoIcons.flag_fill)),
  ];

  UnmodifiableListView<Category> get categories => UnmodifiableListView(_categories);

  Category removeItem(index) {
    return _categories.removeAt(index);
  }

  void insert(index,item){
  _categories.insert(index, item);
  }

  List<Category> get selectedCategories {
    return _categories.where((category) => category.isChecked!).toList();
  }


}
