import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_ai/constants/api_constant.dart';
import 'package:home_ai/controller/session_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var isLoading = false.obs;

  final session = SessionController.instance;

  var loggedInUser = Rxn<User>();
  final displayName = RxnString();
  final email = RxnString();
  final photoUrl = RxnString();

  @override
  void onInit() {
    super.onInit();
    final firebaseUser = FirebaseAuth.instance.currentUser;
    loggedInUser.value = firebaseUser;

    displayName.value = firebaseUser?.displayName ?? session.displayName;
    email.value = firebaseUser?.email ?? session.email;
    photoUrl.value = firebaseUser?.photoURL ?? session.photoUrl;
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(ApiConstants.login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = data["user"];
        final dynamic rawName = user is Map<String, dynamic>
            ? (user["name"] ?? user["full_name"] ?? user["username"])
            : null;
        final dynamic rawEmail =
            user is Map<String, dynamic> ? user["email"] : null;

        final String? nameString = rawName?.toString();
        final String? emailString = (rawEmail ?? email).toString();

        await session.saveSession(
          data["user"]["id"].toString(),
          data["token"],
          DateTime.now().add(const Duration(minutes: 60)),
          displayName: nameString,
          email: emailString,
        );

        displayName.value = nameString;
        this.email.value = emailString;

        Get.snackbar(
          "Success",
          "Login Successful",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );

        return true;
      } else {
        final data = jsonDecode(response.body);
        Get.snackbar(
          "Error",
          data["message"] ?? "Login failed",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Exception",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> login() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize();

      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

      if (googleUser == null) return false;

      final googleDisplayName = googleUser.displayName;
      final googleEmail = googleUser.email;
      final googlePhotoUrl = googleUser.photoUrl;

      final GoogleSignInAuthentication userAuth = googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: userAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      final firebaseUser = FirebaseAuth.instance.currentUser;
      loggedInUser.value = firebaseUser;

      displayName.value = firebaseUser?.displayName ?? googleDisplayName;
      email.value = firebaseUser?.email ?? googleEmail;
      photoUrl.value = firebaseUser?.photoURL ?? googlePhotoUrl;

      if (firebaseUser != null) {
        final tokenResult = await firebaseUser.getIdTokenResult();
        final idToken = tokenResult.token;
        final expiry = tokenResult.expirationTime ??
            DateTime.now().add(const Duration(hours: 1));
        if (idToken != null) {
          await session.saveSession(
            firebaseUser.uid,
            idToken,
            expiry,
            displayName: displayName.value,
            email: email.value,
            photoUrl: photoUrl.value,
          );
        }
      }
      return firebaseUser != null;
    } on GoogleSignInException catch (e) {
      debugPrint("Google login error: $e");
      return false;
    } catch (e) {
      debugPrint("Google login error: $e");
      return false;
    }
  }

  bool isLoggedIn() => session.hasValidSession;

  Future<void> logout() async {
    await session.clearSession();
    try {
      await FirebaseAuth.instance.signOut();
    } catch (_) {}

    loggedInUser.value = null;
    displayName.value = null;
    email.value = null;
    photoUrl.value = null;

    Get.snackbar(
      "Success",
      "Logged out successfully",
      snackPosition: SnackPosition.TOP,
    );
  }

  String? getToken() => session.token;
  Map<String, dynamic>? getUser() => null;
}
