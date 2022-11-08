import 'package:eighty_three_task/base/models/cart_sql_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart' as gt;

class SqlController extends gt.GetxController {
  Database? _database;
  String tableName = 'user_cart';
  String dbName = 'EightyThreeDb.db';

  Future initDatabase() async {
    return _database = await _initDB();
  }

  Future<Database> _initDB() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, dbName);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $tableName ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "type TEXT,"
          "one_piece_price DOUBLE,"
          "item_id INT,"
          "quantity INT,"
          "cart_quantity INT,"
          "image TEXT"
          ")");
    });
  }

  @override
  void onInit() {
    initDatabase();
    super.onInit();
  }

  Future insert(CartSqlModel model) async {
    await _database!.insert(tableName, model.toJson());
  }

  Future<List<CartSqlModel>> loadAll() async {
    var res = await _database!.query(tableName);
    List<CartSqlModel> list = res.isNotEmpty
        ? res.map((item) => CartSqlModel.fromJson(item)).toList()
        : [];
    return list;
  }

  Future updateItem(CartSqlModel update) async {
    var res = await _database!.update(tableName, update.toJson(),
        where: "item_id = ?", whereArgs: [update.itemId]);
    return res;
  }

  Future deleteItem(String id) async {
    await _database!.delete(tableName, where: "item_id = ?", whereArgs: [id]);
  }

  Future deleteAll() async {
    _database!.rawDelete("DELETE FROM $tableName");
  }
}
