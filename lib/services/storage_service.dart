import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

// Storage service initialize hiij bga ni gehdee yag yaj ashiglahiig ni sain oilgoogu

FlutterSecureStorage secureStorage = const FlutterSecureStorage();

class LocalStorageService {
  final _storage = FlutterSecureStorage();

  Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }
}
