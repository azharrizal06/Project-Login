import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';

import '../controllers/pageco_controller.dart';

class PagecoView extends GetView<PagecoController> {
  @override
  Widget build(BuildContext context) {
    // final tinggi = MediaQuery.of(context).size.height;
    final lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('PagecoView'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: lebar * 0.65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black),
                  child: Column(
                    children: [
                      Text("produk"),
                      Text("Har......................ga"),
                      Text("produk"),
                      Text("Harga"),
                      Text("produk"),
                      Text("Harga"),
                      Text("produk"),
                      Text("Harga"),
                      Text("produk"),
                      Text("Harga"),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
