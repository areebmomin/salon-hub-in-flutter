import 'package:flutter/material.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/user_registration_flow.dart';
import 'package:saloon_hub/user/about_saloon_page/about_saloon_page.dart';
import 'package:saloon_hub/user/book_page/book_page.dart';
import 'package:saloon_hub/user/profile_page/profile_page.dart';
import 'package:saloon_hub/utils/index.dart';
import 'auth/login_page.dart';
import 'auth/saloon_auth/saloon_registration/saloon_registration_flow.dart';
import 'saloon/saloon_home_page.dart';
import 'user/edit_profile_page/edit_profile_page.dart';
import 'user/user_home_page.dart';
import 'utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget getLandingPage() {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        switch (currentUser.providerData.firstOrNull?.providerId) {
          case 'password':
            return const SaloonHomePage();
          case 'phone':
            return const UserHomePage();
          default:
            return const LoginPage();
        }
      } else {
        return const LoginPage();
      }
    }

    late Widget page;
    var name = settings.name;

    if (name == Routes.root) {
      page = getLandingPage();
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
    } else if (name == Routes.userProfilePage) {
      page = const ProfilePage();
    } else if (name == Routes.editUserProfile) {
      page = const EditProfilePage();
    } else if (name == Routes.bookPage) {
      page = const BookPage();
    } else if (name == Routes.aboutSaloonPage) {
      page = const AboutSaloonPage();
    } else {
      page = Scaffold(body: Center(child: Text('No route defined for $name')));
    }

    return MaterialPageRoute(builder: (context) => page);
  }
}
