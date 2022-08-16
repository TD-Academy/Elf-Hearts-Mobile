import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum StorageKey { userName, userId, accessToken, refreshToken }

class LocalStorageService {
  final _storage = const FlutterSecureStorage();

  writeData(String key, String value) async {
    await _storage.write(key: key.toString(), value: value);
  }

  readSecureData(key) async {
    var readData = await _storage.read(key: key.toString());
    return readData;
  }

  readAllSecureData() async {
    Map<String, String> readAllData = await _storage.readAll();
    return readAllData;
  }

  deleteSecureData(String key) async {
    await _storage.delete(key: key.toString());
  }

  deleteAllSecureData() async {
    _storage.deleteAll;
  }
}
