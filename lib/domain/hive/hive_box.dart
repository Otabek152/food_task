import 'package:food_task/domain/hive/hive_add.dart';
import 'package:hive/hive.dart';

abstract class HiveBox {
  static final Box<HiveAdd> foods = Hive.box<HiveAdd>('foods');
}
