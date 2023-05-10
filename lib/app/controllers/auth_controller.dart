import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get statusauth => auth.authStateChanges();

  Future<void> signup(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Signup berhasil
      Get.offAllNamed(Routes.LOGIN);
      print("Signup berhasil, user: " + email);
    } on FirebaseAuthException catch (e) {
      // Signup gagal
      if (e.code == 'email-already-in-use') {
        Get.dialog(AlertDialog(
          title: Text("Signup Gagal"),
          content: Text(
              "Email Telah Terdaftar. Jika Anda sudah memiliki akun, silakan login."),
          actions: [
            TextButton(
              child: Text("Login"),
              onPressed: () {
                Get.offAllNamed(Routes.LOGIN);
              },
            ),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ));
      } else {
        print("Signup gagal: ${e.message}");
      }
    } catch (e) {
      print("Signup gagal: ${e.toString()}");
    }
  }

  Future<void> login(String emailc, String passwordc) async {
    auth
        .signInWithEmailAndPassword(email: emailc, password: passwordc)
        .then((userCredential) {
      // Login berhasil

      Get.offAllNamed(Routes.HOME);
      print("Login berhasil, user: " + emailc);
    }).catchError((error) {
      // ignore: invalid_return_type_for_catch_error
      Get.dialog(AlertDialog(
          title: Text("Gagal Login"),
          content: Text(
              ('Akun yang anda masukan Belum terdaftar silakan Buat akun terlebih dahulu')),
          actions: [
            TextButton(
                child: Text("OK"),
                onPressed: () {
                  Get.back();
                })
          ]));
      // Login gagal
      // print("Login gagal: " + error.toString());
    });
  }

  void logout() {
    auth.signOut().then((value) {
      // Logout berhasil
      Get.offAllNamed(Routes.LOGIN);
      print("Logout berhasil");
    }).catchError((error) {
      // Logout gagal
      print("Logout gagal: " + error.toString());
    });
  }
}
