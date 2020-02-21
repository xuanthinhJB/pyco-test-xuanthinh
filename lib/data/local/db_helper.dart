import 'package:pyco_test_tony/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {

  static final String USER = 'User';

  DbHelper.internal();

  static final DbHelper _instance = DbHelper.internal();

  factory DbHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await _initDb();
      return _db;
    }
  }

  Future<Database> _initDb() async {
    String root = await getDatabasesPath();
    String dbPath = join(root, 'pyco.db');
    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
      onDowngrade: _onDowngrade,
      onUpgrade: _onUpgrade
    );
    return db;
  }

  void _onDowngrade(Database db, int version, int optionValue) {

  }

  void _onUpgrade(Database db, int version, int optionValue) {

  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $USER (" +
      "UserId INTEGER PRIMARY KEY," +
      "Gender TEXT," + 
      "Email TEXT," + 
      "Title TEXT," + 
      "First TEXT," +
      "Last TEXT," +
      "Street TEXT," + 
      "City TEXT," + 
      "State TEXT," +
      "Zip TEXT," +
      "Username TEXT," + 
      "Password TEXT," + 
      "Salt TEXT," + 
      "Md5 TEXT," +
      "Sha1 TEXT," + 
      "Sha256 TEXT," + 
      "Registered TEXT," +
      "Dob TEXT," + 
      "Phone TEXT," + 
      "Cell TEXT," +
      "Ssn TEXT," +
      "Picture TEXT," +
      "Seed TEXT," +
      "Version TEXT, " +
      "Base64 TEXT"
      ");"
    );
  }

  Future<int> insertUser(User user) async {
    Database database = await db;
    return database.insert(USER, user.toMap());
  }

  Future<List<User>> getUsers() async {
    Database database = await db;
    var res = await database.query(USER);
    return User.fromDBArray(res);
  }

  void dispose() {
    if (_db != null) {
      _db.close();
    }
  }
}