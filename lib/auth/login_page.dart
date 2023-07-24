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

part 'widgets/tab_layout_and_login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            create: (BuildContext context) => UserLoginCubit(
                RepositoryProvider.of<UserLoginRepository>(context)),
          ),
          BlocProvider<SaloonLoginCubit>(
            create: (BuildContext context) => SaloonLoginCubit(
                RepositoryProvider.of<SaloonLoginRepository>(context)),
          ),
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: ScrollConfiguration(
              behavior: NoOverscrollBehaviour(),
              child: const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SaloonHubToolbar(),
                    LoginHeading(),
                    TabLayoutAndLoginWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
