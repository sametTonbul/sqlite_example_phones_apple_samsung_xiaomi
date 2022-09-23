import 'package:flutter_phone_sqlite/xiaomi.dart';
import 'package:flutter_phone_sqlite/databasehelper.dart';

class phoneXiaomiDAO {
  Future<List<Xiaomi>> allPhones() async {
    var database = await Databasehelper.accessDatabase();
    List<Map<String, dynamic>> mapsXiaomi =
        await database.rawQuery("SELECT * FROM Xiaomi");
    return List.generate(mapsXiaomi.length, (index) {
      var rowXiaomi = mapsXiaomi[index];
      return Xiaomi(
        rowXiaomi['phone_id'],
        rowXiaomi['phone_model'],
        rowXiaomi['phone_software'],
        rowXiaomi['phone_year'],
      );
    });
  }
}
