import 'package:flutter/material.dart';
import 'package:repository/salon/salon_profile_page/models/salon_profile_info.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:salon_hub/auth/user_auth/user_registration/user_registration_flow.dart';
import 'package:salon_hub/salon/salon_edit_profile_page/salon_edit_profile_page.dart';
import 'package:salon_hub/salon/salon_profile_page/salon_profile_page.dart';
import 'package:salon_hub/user/about_salon_page/about_salon_page.dart';
import 'package:salon_hub/user/book_page/book_page.dart';
import 'package:salon_hub/user/profile_page/profile_page.dart';
import 'package:salon_hub/utils/index.dart';
import 'auth/login_page.dart';
import 'auth/salon_auth/salon_registration/salon_registration_flow.dart';
import 'salon/salon_home_page.dart';
import 'user/edit_profile_page/edit_profile_page.dart';
import 'user/user_home_page.dart';
import 'utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Widget page;
    var name = settings.name;

    if (name == Routes.root) {
      page = _getLandingPage();
    } else if (name!.startsWith(Routes.userRegistrationFlow)) {
      final subRoute = name.substring(Routes.userRegistrationFlow.length);
      page = UserRegistrationFlow(userRegistrationPageRoute: subRoute);
      return _bottomToTopTransitionRoute(settings, page);
    } else if (name.startsWith(Routes.salonRegistrationFlow)) {
      final subRoute = name.substring(Routes.salonRegistrationFlow.length);
      page = SalonRegistrationFlow(salonRegistrationPageRoute: subRoute);
      return _bottomToTopTransitionRoute(settings, page);
    } else if (name == Routes.userHomePage) {
      page = const UserHomePage();
      return _rightToLeftTransitionRoute(settings, page);
    } else if (name == Routes.salonHomePage) {
      page = const SalonHomePage();
      return _rightToLeftTransitionRoute(settings, page);
    } else if (name == Routes.userProfilePage) {
      page = const ProfilePage();
      return _rightToLeftTransitionRoute(settings, page);
    } else if (name == Routes.editUserProfile) {
      page = const EditProfilePage();
    } else if (name == Routes.bookPage) {
      final salonInfo = settings.arguments as UserHomePageSalonInfo;
      page = BookPage(salonInfo);
    } else if (name == Routes.aboutSalonPage) {
      final salonInfo = settings.arguments as UserHomePageSalonInfo;
      page = AboutSalonPage(salonInfo);
    } else if (name == Routes.salonProfilePage) {
      page = const SalonProfilePage();
      return _rightToLeftTransitionRoute(settings, page);
    } else if (name == Routes.salonEditProfilePage) {
      final salonInfo = settings.arguments as SalonProfileInfo;
      page = SalonEditProfilePage(salonInfo.convertToEditProfileModel());
    } else {
      page = Scaffold(body: Center(child: Text('No route defined for $name')));
    }

    return MaterialPageRoute(builder: (context) => page);
  }

  static Widget _getLandingPage() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      switch (currentUser.providerData.firstOrNull?.providerId) {
        case 'password':
          return const SalonHomePage();
        case 'phone':
          return const UserHomePage();
        default:
          return const LoginPage();
      }
    } else {
      return const LoginPage();
    }
  }

  static PageRouteBuilder<dynamic> _bottomToTopTransitionRoute(
    RouteSettings settings,
    Widget page,
  ) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.ease));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  static PageRouteBuilder<dynamic> _rightToLeftTransitionRoute(
    RouteSettings settings,
    Widget page,
  ) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.ease));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
