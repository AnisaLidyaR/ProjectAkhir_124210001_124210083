import 'package:hive/hive.dart';

part 'list.g.dart';

@HiveType(typeId: 0)
class MyList extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  MyList({required this.name, required this.description});
}