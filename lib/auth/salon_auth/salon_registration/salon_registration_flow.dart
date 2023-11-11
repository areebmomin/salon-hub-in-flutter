import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:repository/auth/salon_auth/salon_registration/salon_registration_repository.dart';
import 'package:salon_hub/auth/salon_auth/salon_registration/verify_business_page/verify_business_page.dart';
import '../../../utils/index.dart';
import 'bloc/salon_registration_bloc.dart';
import 'business_details_page/business_details_page.dart';

class SalonRegistrationFlow extends StatefulWidget {
  static SalonRegistrationFlowState of(BuildContext context) {
    return context.findAncestorStateOfType<SalonRegistrationFlowState>()!;
  }

  const SalonRegistrationFlow({
    super.key,
    required this.salonRegistrationPageRoute,
  });

  final String salonRegistrationPageRoute;

  @override
  State<SalonRegistrationFlow> createState() => SalonRegistrationFlowState();
}

class SalonRegistrationFlowState extends State<SalonRegistrationFlow> {
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
    return RepositoryProvider<SalonRegistrationRepository>(
      create: (context) => FirebaseSalonRegistrationRepository(),
      child: BlocProvider(
        create: (context) => SalonRegistrationBloc(
            RepositoryProvider.of<SalonRegistrationRepository>(context)),
        child: BlocListener<SalonRegistrationBloc, SalonRegistrationState>(
          listener: (context, state) {
            if (state is ShowToast) {
              Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
              );
            } else if (state is OpenVerifyPage) {
              _navigatorKey.currentState
                  ?.pushNamed(Routes.salonRegistrationVerifyPage);
            } else if (state is GotoSalonHomePage) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.salonHomePage,
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
                initialRoute: widget.salonRegistrationPageRoute,
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
      case Routes.salonRegistration:
        page = const BusinessDetailsPage();
        break;
      case Routes.salonRegistrationVerifyPage:
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
