import 'package:auth_repository/saloon_registration/saloon_registration_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saloon_hub/auth/saloon_auth/saloon_registration/verify_business_page/verify_business_page.dart';
import '../../../utils/index.dart';
import 'business_details_page/business_details_page.dart';
import 'cubit/saloon_registration_cubit.dart';

class SaloonRegistrationFlow extends StatefulWidget {
  static SaloonRegistrationFlowState of(BuildContext context) {
    return context.findAncestorStateOfType<SaloonRegistrationFlowState>()!;
  }

  const SaloonRegistrationFlow({
    super.key,
    required this.saloonRegistrationPageRoute,
  });

  final String saloonRegistrationPageRoute;

  @override
  State<SaloonRegistrationFlow> createState() => SaloonRegistrationFlowState();
}

class SaloonRegistrationFlowState extends State<SaloonRegistrationFlow> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var _isVerifyPageCurrentPage = false;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _isExitDesired() async {
    return _isVerifyPageCurrentPage
        ? _onVerifyPageCloseButtonClicked()
        : _onRegistrationPageCloseButtonClicked();
  }

  bool _onRegistrationPageCloseButtonClicked() {
    Navigator.of(context).pop(true);
    return true;
  }

  bool _onVerifyPageCloseButtonClicked() {
    _isVerifyPageCurrentPage = false;
    _navigatorKey.currentState?.pop(true);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<SaloonRegistrationRepository>(
      create: (context) => FirebaseSaloonRegistrationRepository(),
      child: BlocProvider(
        create: (context) => SaloonRegistrationCubit(
            RepositoryProvider.of<SaloonRegistrationRepository>(context)),
        child: BlocListener<SaloonRegistrationCubit, SaloonRegistrationState>(
          listener: (context, state) {
            if (state is ShowToast) {
              Fluttertoast.showToast(
                  msg: state.message, toastLength: Toast.LENGTH_SHORT);
            } else if (state is OpenVerifyPage) {
              _navigatorKey.currentState
                  ?.pushNamed(Routes.saloonRegistrationVerifyPage);
            } else if (state is GotoSaloonHomePage) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.saloonHomePage,
                (route) => false,
              );
            } else if (state is CloseButtonClicked) {
              _onRegistrationPageCloseButtonClicked();
            } else if (state is VerifyCloseButtonClicked) {
              _onVerifyPageCloseButtonClicked();
            }
          },
          child: WillPopScope(
            onWillPop: _isExitDesired,
            child: Scaffold(
              body: Navigator(
                key: _navigatorKey,
                initialRoute: widget.saloonRegistrationPageRoute,
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
      case Routes.saloonRegistration:
        page = const BusinessDetailsPage();
        break;
      case Routes.saloonRegistrationVerifyPage:
        _isVerifyPageCurrentPage = true;
        page = const VerifyBusinessPage();
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
