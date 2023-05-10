import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<QuerySnapshot<Object?>> ambildata() async {
    CollectionReference produkk = firestore.collection("produk");
    return produkk.get();
  }

  Stream Streamdata() {
    CollectionReference produkk = firestore.collection("produk");
    return produkk.snapshots();
  }

  void hapus(String docID) async {
    DocumentReference dochapus = firestore.collection("produk").doc(docID);
    try {
      Get.defaultDialog(
          title: "yakin",
          middleText: "lanjukan untuk menghapus",
          textCancel: "tidak",
          textConfirm: "iya",
          onConfirm: () async {
            await dochapus.delete();
            Get.back();
          });
    } catch (e) {
      print(e);
    }
  }
}
