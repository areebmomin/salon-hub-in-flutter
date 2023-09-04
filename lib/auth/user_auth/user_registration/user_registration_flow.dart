import 'package:repository/user_login/user_login_repository.dart';
import 'package:repository/user_registration/user_registration_repository.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserLoginRepository>(
          create: (context) => FirebaseUserLoginRepository(),
        ),
        RepositoryProvider<UserRegistrationRepository>(
          create: (context) => FirebaseUserRegistrationRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) => UserRegistrationCubit(
          RepositoryProvider.of<UserLoginRepository>(context),
          RepositoryProvider.of<UserRegistrationRepository>(context),
        ),
        child: BlocListener<UserRegistrationCubit, UserRegistrationState>(
          listener: (context, state) {
            if (state is ShowToast) {
              Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
              );
            } else if (state is OpenOtpPage) {
              _navigatorKey.currentState
                  ?.pushNamed(Routes.userRegistrationOtpPage);
            } else if (state is GotoUserHomePage) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.userHomePage,
                (route) => false,
              );
            } else if (state is CloseButtonClicked) {
              onRegistrationPageCloseButtonClicked();
            } else if (state is OtpCloseButtonClicked) {
              onOtpPageCloseButtonClicked();
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
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {
      case Routes.userRegistration:
        page = const UserRegistrationPage();
        break;
      case Routes.userRegistrationOtpPage:
        _isOtpPageCurrentPage = true;
        page = const UserRegistrationOtpPage();
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
