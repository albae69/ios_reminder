import 'package:ios_reminder/widgets/category_icon.dart';

class Category {
  String id;
  String name;
  bool? isChecked;
  final CategoryIcon icon;

  Category(
      {required this.id,
      required this.name,
      this.isChecked = true,
      required this.icon});

  void toggleCheckbox(){
    isChecked = !isChecked!;
  }



}
