import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login/app/controllers/auth_controller.dart';
import 'package:login/app/routes/app_pages.dart';

class SignupView extends StatelessWidget {
  final emailc = TextEditingController();
  final passwordc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    final auth = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              // color: Colors.black,

              // height: tinggi,
              color: Colors.black,
              height: tinggi,
              width: lebar,
              child: Column(
                children: [
                  Container(
                      width: lebar,
                      height: tinggi * 0.2,
                      child: Image.asset(
                        "assets/gambar/bg.png",
                        fit: BoxFit.cover,
                      )),
                  Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Create a new account",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: lebar * 0.74,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            TextField(
                              controller: emailc,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    size: 25,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff29B6F6), width: 4),
                                      borderRadius: BorderRadius.circular(10)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Email"

                                  // hintStyle: TextStyle(color: Colors.black)
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Password",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: passwordc,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                size: 25,
                              ),
                              suffixIcon: Icon(
                                Icons.visibility_off,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff29B6F6), width: 4),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Password",
                              fillColor: Colors.white,
                              filled: true),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
//tombol
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(110, 10, 110, 10),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      onPressed: () => auth.signup(emailc.text, passwordc.text),
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("Already have account? ",
                          style: TextStyle(color: Color(0xff616161))),
                      TextButton(
                          onPressed: () => Get.offAndToNamed(Routes.LOGIN),
                          child: Text("Login",
                              style: TextStyle(color: Colors.white))),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
