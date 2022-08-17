import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum StorageKey { userName, userId, accessToken, refreshToken }

class LocalStorageService {
  final _storage = const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));

  writeData(StorageKey key, String? value) async {
    await _storage.write(key: key.name, value: value);
  }

  readData(StorageKey key) async {
    var readData = await _storage.read(key: key.name);
    return readData;
  }

  readAllData() async {
    Map<String, String> readAllData = await _storage.readAll();
    return readAllData;
  }

  deleteData(StorageKey key) async {
    await _storage.delete(key: key.name);
  }

  deleteAllData() async {
    _storage.deleteAll;
  }
}
