import '../../../dao/pet_dao.dart';
import '../../../models/pet.dart';

class PetService {
  static PetDao? dao;

  static Future<List<Pet>> findAllPets() async {
    final result = await dao!.findAllPets();
    return result;
  }

  static Future<Stream<Pet?>> findPetById(int id) async {
    final result = dao!.findPetById(id);
    return result;
  }
}
