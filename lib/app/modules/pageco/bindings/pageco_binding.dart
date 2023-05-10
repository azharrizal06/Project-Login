import 'package:get/get.dart';

import '../controllers/pageco_controller.dart';

class PagecoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PagecoController>(
      () => PagecoController(),
    );
  }
}
