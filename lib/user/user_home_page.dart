import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:repository/user/user_home_page/user_home_page_repository.dart';
import '../utils/index.dart';
import 'cubit/user_home_page_cubit.dart';

part 'widgets/salon_hub_toolbar.dart';

part 'widgets/filter_bottom_sheet.dart';

part 'widgets/filter_floating_action_button.dart';

part 'widgets/salon_list_view.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UserHomePageRepository>(
      create: (context) => FirebaseUserHomePageRepository(),
      child: BlocProvider(
        create: (context) => UserHomePageCubit(
          RepositoryProvider.of<UserHomePageRepository>(context),
        ),
        child: BlocListener<UserHomePageCubit, UserHomePageState>(
          listener: (context, state) {
            if (state is ShowToast) {
              Fluttertoast.showToast(
                  msg: state.message, toastLength: Toast.LENGTH_SHORT);
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar(context, null),
            body: SafeArea(
              child: BlocBuilder<UserHomePageCubit, UserHomePageState>(
                buildWhen: (previousState, state) {
                  return state is Loading || state is ShowSalonList;
                },
                builder: (context, state) {
                  if (state is ShowSalonList) {
                    return const Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: SalonListView(),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            floatingActionButton: getFilterFloatingButton(context),
          ),
        ),
      ),
    );
  }
}
