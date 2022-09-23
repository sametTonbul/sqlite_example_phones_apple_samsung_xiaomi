import 'package:flutter_phone_sqlite/samsung.dart';
import 'package:flutter_phone_sqlite/databasehelper.dart';

class phoneSamsungDAO {
  Future<List<Samsung>> allPhones() async {
    var database = await Databasehelper.accessDatabase();
    List<Map<String, dynamic>> mapsSamsung =
        await database.rawQuery("SELECT * FROM Samsung");
    return List.generate(mapsSamsung.length, (index) {
      var rowSamsung = mapsSamsung[index];
      return Samsung(
        rowSamsung['phone_id'],
        rowSamsung['phone_model'],
        rowSamsung['phone_software'],
        rowSamsung['phone_year'],
      );
    });
  }
}
