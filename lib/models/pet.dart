import 'package:floor/floor.dart';
import 'package:pet_health/models/race.dart';

@entity
class Pet {
  @primaryKey
  int? id;
  final String name;
  final Race race;

  Pet(this.name, this.race);

  @override
  String toString() {
    return 'Pet{id: $id, name: $name, race: $race}';
  }
}