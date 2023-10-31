import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "FacilityDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'facilities';

  static final columnId = '_id';
  static final columnFacilityCode = 'facilityCode';
  static final columnFacilityName = 'facilityName';
  static final columnDistrictName = 'districtName';
  static final columnOwner = 'owner';

  // Make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnFacilityCode TEXT NOT NULL,
            $columnFacilityName TEXT NOT NULL,
            $columnDistrictName TEXT NOT NULL,
            $columnOwner TEXT NOT NULL
          )
          ''');
  }

  // Insert a facility into the database
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }
}
