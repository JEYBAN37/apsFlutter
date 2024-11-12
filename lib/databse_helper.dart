import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:aps/model/infogeneral.dart';
import 'dart:async';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE infogeneral(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            typeRegister INTEGER,
            numberRegister INTEGER,
            consent INTEGER,
            departament TEXT,
            zonalUnit TEXT,
            municipality TEXT,
            territory TEXT,
            microterritory TEXT,
            nameBranding TEXT,
            address TEXT,
            longitud REAL,
            latitud REAL,
            homeLocation TEXT,
            idFamilia TEXT,
            estratum INTEGER,
            households TEXT,
            numFamilies INTEGER,
            people INTEGER,
            basicTeam TEXT,
            idPrimaryProvider TEXT,
            pollster TEXT,
            idFicha TEXT,
            creationDate TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertInfoGeneral(InfoGeneral infoGeneral) async {
    final db = await database;
    return await db.insert('infogeneral', infoGeneral.toMap());
  }

  Future<List<InfoGeneral>> getInfoGeneralList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('infogeneral');
    return List.generate(maps.length, (i) {
      return InfoGeneral(
        id: maps[i]['id'],
        typeRegister: maps[i]['typeRegister'],
        numberRegister: maps[i]['numberRegister'],
        consent: maps[i]['consent'],
        departament: maps[i]['departament'],
        zonalUnit: maps[i]['zonalUnit'],
        municipality: maps[i]['municipality'],
        territory: maps[i]['territory'],
        microterritory: maps[i]['microterritory'],
        nameBranding: maps[i]['nameBranding'],
        address: maps[i]['address'],
        longitud: maps[i]['longitud'],
        latitud: maps[i]['latitud'],
        homeLocation: maps[i]['homeLocation'],
        idFamilia: maps[i]['idFamilia'],
        estratum: maps[i]['estratum'],
        households: maps[i]['households'],
        numFamilies: maps[i]['numFamilies'],
        people: maps[i]['people'],
        basicTeam: maps[i]['basicTeam'],
        idPrimaryProvider: maps[i]['idPrimaryProvider'],
        pollster: maps[i]['pollster'],
        idFicha: maps[i]['idFicha'],
        creationDate: maps[i]['creationDate'],
      );
    });
  }
}