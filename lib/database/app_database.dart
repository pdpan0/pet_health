// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:pet_health/dao/pet_dao.dart';
import 'package:pet_health/models/pet.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Pet])
abstract class AppDatabase extends FloorDatabase {
  PetDao get petDao;
}
