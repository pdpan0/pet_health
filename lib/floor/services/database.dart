
import 'package:pet_health/floor/database/app_database.dart';

class Database {
  static Future<AppDatabase> initializeDatabase() async{
    return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}
