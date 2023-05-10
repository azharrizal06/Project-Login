import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/editpage_controller.dart';

class EditpageView extends GetView<EditpageController> {
  @override
  Widget build(BuildContext context) {
    // final tinggi = MediaQuery.of(context).size.height;
    final lebar = MediaQuery.of(context).size.width;
    final tinggi = MediaQuery.of(context).size.height;
    final ide = Get.arguments.toString();

    return SafeArea(
        child: Scaffold(
            body: FutureBuilder<DocumentSnapshot<Object?>>(
                future: controller.ambil(ide),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.data != null &&
                      snapshot.data!.data() != null) {
                    print(snapshot);
                    var dataa = snapshot.data!.data() as Map<String, dynamic>;
                    controller.produkC.text = dataa["produkk"] ?? "";
                    controller.hargaC.text = dataa["harga"] ?? "";
                    return SingleChildScrollView(
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
                                  "Edit",
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Edit Produk",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: lebar * 0.74,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0xff29B6F6),
                                                            width: 4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                fillColor: Colors.white,
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                                    color: Color(0xff29B6F6),
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                  onPressed: () => controller.edit(
                                      controller.produkC.text,
                                      controller.hargaC.text,
                                      ide),
                                  child: Text("Edit Data"),
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
                    );
                  } else {
                    return Center(
                      child: Text("load"),
                    );
                  }
                })));

    //   Scaffold(
    //       appBar: AppBar(
    //         title: Text('AddView'),
    //         centerTitle: true,
    //       ),
    //       body: FutureBuilder<DocumentSnapshot<Object?>>(
    //           future: controller.ambil(ide),
    //           builder: (context, snapshot) {
    //             if (snapshot.hasData &&
    //                 snapshot.data != null &&
    //                 snapshot.data!.data() != null) {
    //               print(snapshot);
    //               var dataa = snapshot.data!.data() as Map<String, dynamic>;
    //               controller.produkC.text = dataa["produkk"] ?? "";
    //               controller.hargaC.text = dataa["harga"] ?? "";
    //               return Center(
    //                 child: Container(
    //                   width: lebar * 0.7,
    //                   child: Column(
    //                     children: [
    //                       TextField(
    //                         controller: controller.produkC,
    //                         decoration: InputDecoration(
    //                             focusedBorder: OutlineInputBorder(
    //                                 borderSide: BorderSide(
    //                                     color: Color(0xff29B6F6), width: 4),
    //                                 borderRadius: BorderRadius.circular(10)),
    //                             fillColor: Colors.white,
    //                             filled: true,
    //                             enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                             ),
    //                             hintText: "Produk"

    //                             // hintStyle: TextStyle(color: Colors.black)
    //                             ),
    //                       ),
    //                       TextField(
    //                         controller: controller.hargaC,
    //                         decoration: InputDecoration(
    //                             focusedBorder: OutlineInputBorder(
    //                                 borderSide: BorderSide(
    //                                     color: Color(0xff29B6F6), width: 4),
    //                                 borderRadius: BorderRadius.circular(10)),
    //                             filled: true,
    //                             enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10),
    //                             ),
    //                             hintText: "Harga"

    //                             // hintStyle: TextStyle(color: Colors.black)
    //                             ),
    //                       ),
    //                       ElevatedButton(
    //                         onPressed: () => controller.edit(
    //                             controller.produkC.text,
    //                             controller.hargaC.text,
    //                             ide),
    //                         child: Text("Edit Data"),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               );
    //             } else {
    //               return Center(
    //                 child: Text("load"),
    //               );
    //             }
    //           }));
    // }
  }
}
