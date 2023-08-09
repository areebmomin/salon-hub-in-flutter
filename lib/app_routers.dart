import 'package:flutter/material.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/user_registration_flow.dart';
import 'package:saloon_hub/utils/index.dart';
import 'auth/login_page.dart';
import 'auth/saloon_auth/saloon_registration/business_details_page/business_details_page.dart';
import 'auth/saloon_auth/saloon_registration/saloon_registration_flow.dart';
import 'saloon/saloon_home_page.dart';
import 'user/user_home_page.dart';
import 'utils/routes.dart';

class AppRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Widget page;
    var name = settings.name;

    if (name == Routes.root) {
      page = const LoginPage();
    } else if (name!.startsWith(Routes.userRegistrationFlow)) {
      final subRoute = name.substring(Routes.userRegistrationFlow.length);
      page = UserRegistrationFlow(
        userRegistrationPageRoute: subRoute,
      );
    } else if (name.startsWith(Routes.saloonRegistrationFlow)) {
      final subRoute = name.substring(Routes.saloonRegistrationFlow.length);
      page = SaloonRegistrationFlow(
        saloonRegistrationPageRoute: subRoute,
      );
    } else if (name == Routes.userHomePage) {
      page = const UserHomePage();
    } else if (name == Routes.saloonHomePage) {
      page = const SaloonHomePage();
    } else {
      page = Scaffold(body: Center(child: Text('No route defined for $name')));
    }

    return MaterialPageRoute(builder: (context) => page);
  }
}
