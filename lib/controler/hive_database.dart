import 'package:hive/hive.dart';
part 'hive_database.g.dart';
@HiveType(typeId: 0)
class contect_data extends HiveObject{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? number;

  contect_data([this.name,this.number]);
}