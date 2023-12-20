import 'package:flutter/material.dart';
import 'package:food_task/domain/hive/hive_add.dart';
import 'package:food_task/domain/hive/hive_box.dart';

class AddProvider extends ChangeNotifier {
  final foodName = TextEditingController();
  final foodDescription = TextEditingController();
  List<int>? image;
  double? value;
  var box = HiveBox.foods;

  Future<void> addFoods() async {
    await box
        .add(HiveAdd(
            foodName: foodName.text.isNotEmpty ? foodName.text : "Null",
            foodDescription:
                foodDescription.text.isNotEmpty ? foodDescription.text : "Null",
            foodImage: image,
            value: value))
        .then((value) => clearFood());
  }

  Future<void> clearFood() async {
    foodName.clear();
    foodDescription.clear();
  }
}
