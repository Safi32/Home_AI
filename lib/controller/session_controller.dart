import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SessionController {
  SessionController._internal();

  static final SessionController _instance = SessionController._internal();
  static SessionController get instance => _instance;

  String? userId;
  String? token;
  DateTime? expiryDate;
  String? displayName;
  String? email;
  String? photoUrl;

  bool get hasValidSession {
    return userId != null &&
        token != null &&
        expiryDate != null &&
        expiryDate!.isAfter(DateTime.now());
  }

  Future<void> setSession(String id, String authToken, DateTime expiry) async {
    await saveSession(id, authToken, expiry);
  }

  Future<void> loadSession() async {
    const storage  =  FlutterSecureStorage();
    final response = await Future.wait([
      storage.read(key: 'userId'),
      storage.read(key: 'token'),
      storage.read(key: 'expiryDate'),
      storage.read(key: 'displayName'),
      storage.read(key: 'email'),
      storage.read(key: 'photoUrl'),
    ]);
    userId = response[0];
    token = response[1];
    String?   expiryDateString = response[2];
    if (expiryDateString != null) { 
      expiryDate = DateTime.parse(expiryDateString);
    }
    displayName = response[3];
    email = response[4];
    photoUrl = response[5];
  }

  Future<void> saveSession(
    String userId,
    String token,
    DateTime expiryDate, {
    String? displayName,
    String? email,
    String? photoUrl,
  }) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'userId', value: userId);
    await storage.write(key: 'token', value: token);
    await storage.write(key: 'expiryDate', value: expiryDate.toIso8601String());
    if (displayName != null) {
      await storage.write(key: 'displayName', value: displayName);
    }
    if (email != null) {
      await storage.write(key: 'email', value: email);
    }
    if (photoUrl != null) {
      await storage.write(key: 'photoUrl', value: photoUrl);
    }

    this.userId = userId;
    this.token = token;
    this.expiryDate = expiryDate;
    if (displayName != null) {
      this.displayName = displayName;
    }
    if (email != null) {
      this.email = email;
    }
    if (photoUrl != null) {
      this.photoUrl = photoUrl;
    }
  }

  Future<void> clearSession() async {
    userId = null;
    token = null;
    expiryDate = null;
    displayName = null;
    email = null;
    photoUrl = null;

    const storage = FlutterSecureStorage();
    await Future.wait([
      storage.delete(key: 'userId'),
      storage.delete(key: 'token'),
      storage.delete(key: 'expiryDate'),
      storage.delete(key: 'displayName'),
      storage.delete(key: 'email'),
      storage.delete(key: 'photoUrl'),
    ]);
  }
}
