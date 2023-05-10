import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:login/app/modules/add/controllers/add_controller.dart';
import 'package:login/app/routes/app_pages.dart';

class AddView extends GetView<AddController> {
  @override
  Widget build(BuildContext context) {
    final tinggi = MediaQuery.of(context).size.height;
    final lebar = MediaQuery.of(context).size.width;
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
                    "Produk",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Tambahkan Produk",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: lebar * 0.74,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("produk",
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
                              controller: controller.produkC,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff29B6F6), width: 4),
                                      borderRadius: BorderRadius.circular(10)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Produk"

                                  // hintStyle: TextStyle(color: Colors.black)
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Harga",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: controller.hargaC,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff29B6F6), width: 4),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Harga"

                              // hintStyle: TextStyle(color: Colors.black)
                              ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => controller.addproduk(
                        controller.produkC.text, controller.hargaC.text),
                    child: Text("Tambah Data"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => Get.toNamed(Routes.HOME),
              icon: Icon(
                Icons.keyboard_return,
                size: 40,
                color: Colors.white,
              ),
            )
          ],
        ),
      )),

      //  Center(
      //   child: Container(
      //     width: lebar * 0.7,
      //     child: Column(
      //       children: [
      //         TextField(
      //           controller: controller.produkC,
      //           decoration: InputDecoration(
      //               focusedBorder: OutlineInputBorder(
      //                   borderSide:
      //                       BorderSide(color: Color(0xff29B6F6), width: 4),
      //                   borderRadius: BorderRadius.circular(10)),
      //               fillColor: Colors.white,
      //               filled: true,
      //               enabledBorder: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //               hintText: "Produk"

      //               // hintStyle: TextStyle(color: Colors.black)
      //               ),
      //         ),
      //         TextField(
      //           controller: controller.hargaC,
      //           decoration: InputDecoration(
      //               focusedBorder: OutlineInputBorder(
      //                   borderSide:
      //                       BorderSide(color: Color(0xff29B6F6), width: 4),
      //                   borderRadius: BorderRadius.circular(10)),
      //               filled: true,
      //               enabledBorder: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //               hintText: "Harga"

      //               // hintStyle: TextStyle(color: Colors.black)
      //               ),
      //         ),
      //         ElevatedButton(
      //           onPressed: () => controller.addproduk(
      //               controller.produkC.text, controller.hargaC.text),
      //           child: Text("Tambah Data"),
      //         )
      //       ],
      //     ),
      //   ),
      // ));
    );
  }
}
