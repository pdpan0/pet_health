import 'package:floor/floor.dart';

@Entity(tableName: 'Pet')
class Pet {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;

  final String breed;

  Pet(this.id, this.name, this.breed);

  @override
  String toString() {
    return 'Pet{id: $id, name: $name}, breed: $breed}';
  }
}
