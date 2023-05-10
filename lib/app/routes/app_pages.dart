import 'package:get/get.dart';

import 'package:login/app/modules/Login/bindings/login_binding.dart';
import 'package:login/app/modules/Login/views/login_view.dart';
import 'package:login/app/modules/add/bindings/add_binding.dart';
import 'package:login/app/modules/add/views/add_view.dart';
import 'package:login/app/modules/editpage/bindings/editpage_binding.dart';
import 'package:login/app/modules/editpage/views/editpage_view.dart';
import 'package:login/app/modules/home/bindings/home_binding.dart';
import 'package:login/app/modules/home/views/home_view.dart';
import 'package:login/app/modules/pageco/bindings/pageco_binding.dart';
import 'package:login/app/modules/pageco/views/pageco_view.dart';
import 'package:login/app/modules/signup/bindings/signup_binding.dart';
import 'package:login/app/modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => AddView(),
      binding: AddBinding(),
    ),
    GetPage(
      name: _Paths.EDITPAGE,
      page: () => EditpageView(),
      binding: EditpageBinding(),
    ),
    GetPage(
      name: _Paths.PAGECO,
      page: () => PagecoView(),
      binding: PagecoBinding(),
    ),
  ];
}
