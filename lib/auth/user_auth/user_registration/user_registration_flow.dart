import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/user_registration_otp_page/user_registration_otp_page.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/user_registration_page/user_registration_page.dart';
import '../../../utils/routes.dart';
import 'cubit/user_registration_cubit.dart';

class UserRegistrationFlow extends StatefulWidget {
  static UserRegistrationFlowState of(BuildContext context) {
    return context.findAncestorStateOfType<UserRegistrationFlowState>()!;
  }

  const UserRegistrationFlow({
    super.key,
    required this.userRegistrationPageRoute,
  });

  final String userRegistrationPageRoute;

  @override
  State<UserRegistrationFlow> createState() => UserRegistrationFlowState();
}

class UserRegistrationFlowState extends State<UserRegistrationFlow> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var _isOtpPageCurrentPage = false;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _isExitDesired() async {
    return _isOtpPageCurrentPage
        ? onOtpPageCloseButtonClicked()
        : onRegistrationPageCloseButtonClicked();
  }

  bool onRegistrationPageCloseButtonClicked() {
    Navigator.of(context).pop(true);
    return true;
  }

  bool onOtpPageCloseButtonClicked() {
    _isOtpPageCurrentPage = false;
    _navigatorKey.currentState?.pop(true);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegistrationCubit(),
      child: BlocListener<UserRegistrationCubit, UserRegistrationState>(
        listener: (context, state) {
          if (state is UserRegistrationShowToast) {
            Fluttertoast.showToast(
                msg: state.message, toastLength: Toast.LENGTH_SHORT);
          } else if (state is UserRegistrationOpenOtpPage) {
            _navigatorKey.currentState
                ?.pushNamed(Routes.userRegistrationOtpPage);
          } else if (state is UserRegistrationGotoUserHomePage) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.userHomePage,
              (route) => false,
            );
          }
        },
        child: WillPopScope(
          onWillPop: _isExitDesired,
          child: Scaffold(
            body: Navigator(
              key: _navigatorKey,
              initialRoute: widget.userRegistrationPageRoute,
              onGenerateRoute: _onGenerateRoute,
            ),
          ),
        ),
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {
      case Routes.userRegistration:
        page = UserRegistrationPage(
          onCloseButtonClicked: onRegistrationPageCloseButtonClicked,
        );
        break;
      case Routes.userRegistrationOtpPage:
        _isOtpPageCurrentPage = true;
        page = UserRegistrationOtpPage(
          onCloseButtonClicked: onOtpPageCloseButtonClicked,
        );
        break;
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
