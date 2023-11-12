import 'package:floor/floor.dart';
import 'package:pet_health/models/pet.dart';

@dao
abstract class PetDAO {
  @Query("SELECT * FROM Pet")
  Future<List<Pet>> findAll();

  @insert
  Future<int> insertPet(Pet pet);

  @delete
  Future<int> deletePet(Pet pet);
}