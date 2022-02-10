import 'package:drift/drift.dart';

class FreeWord extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get freeWord => text().named("フリーワード")();
}