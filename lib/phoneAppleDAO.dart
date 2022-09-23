import 'package:flutter_phone_sqlite/apple.dart';
import 'package:flutter_phone_sqlite/databasehelper.dart';

class phoneAppleDAO {
  Future<List<Apple>> allPhones() async {
    var database = await Databasehelper.accessDatabase();
    List<Map<String, dynamic>> mapsApple =
        await database.rawQuery("SELECT * FROM Apple");
    return List.generate(mapsApple.length, (index) {
      var rowApple = mapsApple[index];
      return Apple(
        rowApple['phone_id'],
        rowApple['phone_model'],
        rowApple['phone_software'],
        rowApple['phone_year'],
      );
    });
  }
}
