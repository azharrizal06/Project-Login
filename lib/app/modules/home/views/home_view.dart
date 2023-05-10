import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:login/app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:login/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    final tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          Container(
            width: lebar,
            color: Colors.black,
            child: Image.asset(
              "assets/gambar/bg.png",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Container(
              child: StreamBuilder(
                stream: controller.Streamdata(),
                builder: (context, Snapshot) {
                  print(Snapshot.data);
                  if (Snapshot.connectionState == ConnectionState.active) {
                    var ddata = Snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: ddata.length,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.fromLTRB(20, 10, 50, 0),
                        width: lebar * 0.65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                colors: [Colors.blue, Colors.white],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama Produk\n${(ddata[index].data() as Map<String, dynamic>)['produkk']}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                          "Rp.${(ddata[index].data() as Map<String, dynamic>)['harga']}",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => Get.toNamed(Routes.EDITPAGE,
                                      arguments: ddata[index].id),
                                  icon: Icon(
                                    Icons.edit_outlined,
                                  ),
                                ),
                              ],
                            ),
                            // onTap: () => Get.toNamed(Routes.EDITPAGE,
                            //   arguments: ddata[index].id),

                            IconButton(
                              onPressed: () =>
                                  controller.hapus(ddata[index].id),
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60),
            width: lebar,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => auth.logout(),
                  icon: Icon(
                    Icons.logout,
                    size: 33,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 300),
          //   child: ElevatedButton(
          //       onPressed: () => Get.toNamed(Routes.PAGECO),
          //       child: Text("coba")),
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offNamed(Routes.ADD);
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 35,
        ),
      ),
    );
  }
}
