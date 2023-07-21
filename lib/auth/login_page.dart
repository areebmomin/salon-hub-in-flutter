import 'package:auth_repository/saloon_login/saloon_login_repository.dart';
import 'package:auth_repository/user_login/user_login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saloon_hub/auth/saloon_auth/index.dart';
import 'package:saloon_hub/auth/saloon_auth/saloon_login/cubit/saloon_login_cubit.dart';
import 'package:saloon_hub/auth/user_auth/index.dart';
import 'package:saloon_hub/auth/user_auth/user_login/cubit/user_login_cubit.dart';
import '../utils/index.dart';

part 'widgets/saloon_hub_toolbar.dart';
part 'widgets/login_heading.dart';
part 'widgets/login_tab_layout.dart';

enum TabType {
  customerTab,
  salonTab,
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TabType selectedTab = TabType.customerTab;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserLoginRepository>(
          create: (context) => FirebaseUserLoginRepository(),
        ),
        RepositoryProvider<SaloonLoginRepository>(
          create: (context) => FirebaseSaloonLoginRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserLoginCubit>(
            create: (BuildContext context) => UserLoginCubit(),
          ),
          BlocProvider<SaloonLoginCubit>(
            create: (BuildContext context) => SaloonLoginCubit(),
          ),
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: ScrollConfiguration(
              behavior: NoOverscrollBehaviour(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SaloonHubToolbar(),
                    const LoginHeading(),
                    LoginTabLayout((TabType position) {
                      if (position != selectedTab) {
                        setState(() {
                          selectedTab = position;
                        });
                      }
                    }),
                    getLoginWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getLoginWidget() {
    switch(selectedTab) {
      case TabType.customerTab:
        return const UserLoginWidget();
      case TabType.salonTab:
        return const SalonLoginWidget();
    }
  }
}

class NoOverscrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
