import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

class LocalStorageService {
  final _storage = const FlutterSecureStorage();

  writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  readAllSecureData() async {
    Map<String, String> readAllData = await _storage.readAll();
    return readAllData;
  }

  deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }

  deleteAllSecureData() async {
    var deleteAllData = _storage.deleteAll;
    return deleteAllData;
  }
}

