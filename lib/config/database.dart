import '../database/app_database.dart';

class Database {
  static Future<AppDatabase> initializeDatabase() async {
    return await $FloorAppDatabase.databaseBuilder('app_database_4.db').build();
  }
}
