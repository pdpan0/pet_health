import 'package:floor/floor.dart';

@Entity(tableName: 'Pet')
class Pet {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;

  Pet(this.id, this.name);

  @override
  String toString() {
    return 'Pet{id: $id, name: $name}';
  }
}
