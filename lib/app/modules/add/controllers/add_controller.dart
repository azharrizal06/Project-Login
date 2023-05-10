import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:login/app/routes/app_pages.dart';

class AddController extends GetxController {
  late TextEditingController produkC;
  late TextEditingController hargaC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void addproduk(String produkC, String hargaC) async {
    CollectionReference produk = firestore.collection("produk");
    try {
      await produk.add({"produkk": produkC, "harga": hargaC});
      Get.defaultDialog(
          title: "berhasil ",
          middleText: "berhasil nambah data",
          onConfirm: () => Get.toNamed(Routes.HOME),
          textConfirm: "oke");
    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: "Gagal nambah data",
          middleText: "Gagal nambah data",
          onConfirm: () => Get.back(),
          textConfirm: "oke");
    }
  }

  @override
  void onInit() {
    produkC = TextEditingController();
    hargaC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    produkC = TextEditingController();
    hargaC = TextEditingController();
    super.onClose();
  }
}
