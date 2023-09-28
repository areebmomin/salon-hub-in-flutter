import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/auth/salon_auth/salon_login/salon_login_repository.dart';
import 'package:repository/auth/user_auth/user_login/user_login_repository.dart';
import 'package:salon_hub/auth/salon_auth/salon_login/cubit/salon_login_cubit.dart';
import 'package:salon_hub/auth/user_auth/user_login/cubit/user_login_cubit.dart';
import '../utils/index.dart';
import 'salon_auth/salon_login/salon_login_page.dart';
import 'user_auth/user_login/user_login_page.dart';

part 'widgets/login_heading.dart';

part 'widgets/login_tab_layout.dart';

part 'widgets/tab_layout_and_login_widget.dart';

part 'widgets/close_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserLoginRepository>(
          create: (context) => FirebaseUserLoginRepository(),
        ),
        RepositoryProvider<SalonLoginRepository>(
          create: (context) => FirebaseSalonLoginRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserLoginCubit>(
            create: (BuildContext context) => UserLoginCubit(
                RepositoryProvider.of<UserLoginRepository>(context)),
          ),
          BlocProvider<SalonLoginCubit>(
            create: (BuildContext context) => SalonLoginCubit(
                RepositoryProvider.of<SalonLoginRepository>(context)),
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
                    CloseButton(),
                    LoginHeading(),
                    TabLayoutAndLogin(),
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
