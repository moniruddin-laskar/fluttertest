import 'package:fluttertest/view/accounts/login_screen.dart';
import 'package:get/get.dart';
import 'navrouter_constants.dart';

class NavRouter {
  static final generateRoute = [
    GetPage(name: login, page: () => LoginScreen()),
  ];
}
