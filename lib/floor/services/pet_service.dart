import 'package:pet_health/floor/dao/pet_dao.dart';
import 'package:pet_health/floor/services/database.dart';

class PetService {
  static Future<PetDAO> getDAO() async {
    return (await Database.initializeDatabase()).petDAO;
  }
}