import 'dart:async';
import 'package:floor/floor.dart';
import 'package:pet_health/models/race.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:pet_health/floor/dao/pet_dao.dart';
import 'package:pet_health/models/pet.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Pet, Race])
abstract class AppDatabase extends FloorDatabase {
  PetDAO get petDAO;
}