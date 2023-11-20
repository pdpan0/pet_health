import 'package:pet_health/dao/pet_dao.dart';

import '../config/database.dart';

class PetService {
  static Future<PetDao> getDAO() async {
    return (await Database.initializeDatabase()).petDao;
  }
}
