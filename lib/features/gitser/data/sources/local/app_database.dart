import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_gitser/features/gitser/data/models/entities/favorite_entity.dart';
import 'package:flutter_gitser/features/gitser/data/sources/local/app_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [FavoriteUser])
abstract class AppDatabase extends FloorDatabase {
  AppDao get dao;
}
