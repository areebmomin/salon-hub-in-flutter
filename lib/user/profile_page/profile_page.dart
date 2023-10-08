import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon_hub/user/profile_page/cubit/user_profile_page_cubit.dart';
import '../../utils/index.dart';
import 'package:repository/user/user_profile_page/user_profile_repository.dart';

part 'widgets/user_profile_section.dart';

part 'widgets/booking_history_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UserProfileRepository>(
      create: (context) => FirebaseUserProfileRepository(),
      child: BlocProvider(
        create: (context) => UserProfilePageCubit(
            RepositoryProvider.of<UserProfileRepository>(context)),
        child: BlocListener<UserProfilePageCubit, UserProfilePageState>(
          listener: (context, state) {
            if (state is GotoLoginPage) {
              // Navigate to Login page
              Navigator.pushReplacementNamed(context, Routes.root);
            } else if (state is GotoEditProfilePage) {
              Navigator.pushNamed(context, Routes.editUserProfile);
            } else if (state is ShowToast) {
              Fluttertoast.showToast(
                  msg: state.message, toastLength: Toast.LENGTH_SHORT);
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: _appBar,
            body: SafeArea(
              child: Stack(
                children: [
                  const SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        UserProfileSection(),
                        BookingHistorySection(),
                      ],
                    ),
                  ),
                  BlocBuilder<UserProfilePageCubit, UserProfilePageState>(
                    builder: (context, state) {
                      if (state is Initial) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

var _appBar = AppBar(
  title: const Text(Strings.profile),
  backgroundColor: Colors.white,
  titleTextStyle: const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: AppColors.headingTextColor,
  ),
  elevation: 3,
  shadowColor: Colors.grey.shade200,
  iconTheme: const IconThemeData(
    color: AppColors.headingTextColor,
  ),
);
