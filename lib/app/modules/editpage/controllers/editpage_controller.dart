import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class EditpageController extends GetxController {
  late TextEditingController produkC;
  late TextEditingController hargaC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> ambil(String docID) async {
    DocumentReference docr = firestore.collection("produk").doc(docID);
    return docr.get();
  }

  void edit(String produkC, String hargaC, String docID) async {
    DocumentReference docup = firestore.collection("produk").doc(docID);
    try {
      await docup.update({"produkk": produkC, "harga": hargaC});
      Get.defaultDialog(
          title: "berhasil ",
          middleText: "berhasil edit data",
          onConfirm: () => Get.toNamed(Routes.HOME),
          textConfirm: "oke");
    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: "Gagal edit data",
          middleText: "Gagal edit data",
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
