import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Menggunakan package `SharedPreferences` menjadi lebih mudah, simple dan cepat
class Storage {
  /// jika data yang disimpan adalah list / map, maka akan diconvert dalam bentuk string, selain itu akan disimpan dalam bentuk tipe data aslinya
  ///
  /// ``` dart
  /// await Storage.write('user', dataUser);
  /// ```
  static Future write(String key, data) async {
    var prefs = await SharedPreferences.getInstance();

    if (data is List || data is Map) {
      prefs.setString(key, json.encode(data));
    } else if (data is bool) {
      prefs.setBool(key, data);
    } else if (data is int) {
      prefs.setInt(key, data);
    } else if (data is String) {
      prefs.setString(key, data);
    } else if (data is double) {
      prefs.setDouble(key, data);
    } else {
      prefs.setString(key, json.encode(data));
    }
  }

  /// ``` dart
  /// var data = await Storage.read('user');
  /// ```
  static Future read(String key) async {
    var prefs = await SharedPreferences.getInstance();

    switch (prefs.get(key).runtimeType) {
      case bool:
        return prefs.getBool(key);
        break;
      case int:
        return prefs.getInt(key);
        break;
      case String:
        return prefs.getString(key);
        break;
      case double:
        return prefs.getDouble(key);
        break;
    }
  }

  /// parameter `except` adalah prioritas, jika `except & only = null` maka semua key akan dihapus, sedangkan parameter `contains` adalah jika ada key yang mirip dengan nilai yang ada pada parameter contains maka data dengan key tersebut akan dihapus.
  ///
  /// `except: ['name']` -> hapus kecuali name, `only: ['name']` -> hapus hanya name, `contains: ['name']` -> hapus key yang mirip dengan name
  ///
  /// ``` dart
  /// await Storage.remove(); // menghapus semua data
  /// ```
  static Future remove({List except, List only, List contains: const []}) async {
    var prefs = await SharedPreferences.getInstance(), keys = prefs.getKeys();
    for (var i = 0; i < keys.toList().length; i++) {
      if (except == null) {
        if (only != null) {
          if (only.indexOf(keys.toList()[i]) > -1) {
            prefs.remove(keys.toList()[i]);
          }
        } else {
          // jika terdapat key yang mirip, maka hapus
          if (contains.isNotEmpty) {
            contains.forEach((e) {
              if (keys.toList()[i].contains(e)) {
                prefs.remove(keys.toList()[i]);
              }
            });
          } else {
            prefs.remove(keys.toList()[i]);
          }
        }
      } else {
        if (except.indexOf(keys.toList()[i]) < 0) {
          prefs.remove(keys.toList()[i]);
        }
      }
    }
  }
}
