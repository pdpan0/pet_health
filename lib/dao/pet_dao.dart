import 'package:floor/floor.dart';
import 'package:pet_health/models/pet.dart';

@dao
abstract class PetDao {
  @Query("SELECT * FROM Pet")
  Future<List<Pet>> findAllPets();

  @Query('SELECT * FROM Pet WHERE id = :id')
  Stream<Pet?> findPetById(int id);

  @insert
  Future<void> insertPet(Pet pet);

  @delete
  Future<void> deletePet(Pet pet);
}
