

import 'package:hive/hive.dart';


part 'hive_add.g.dart';


//flutter packages pub run build_runner build --delete-conflicting-outputs

@HiveType(typeId: 0)
class HiveAdd {
  HiveAdd({required this.foodName , required this.foodDescription , required this.foodImage , required this.value});
  @HiveField(0)
  String foodName;

  @HiveField(1)
  
  String foodDescription;

  @HiveField(2)
  List<int>? foodImage;

  @HiveField(3)
  double? value;
}
