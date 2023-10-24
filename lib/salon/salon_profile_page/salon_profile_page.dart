import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:repository/salon/salon_profile_page/salon_profile_page_repository.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weekday_selector/weekday_selector.dart';
import '../../utils/index.dart';
import 'cubit/salon_profile_page_cubit.dart';

part 'widgets/salon_overview.dart';

part 'widgets/basics_card.dart';

part 'widgets/availability_card.dart';

part 'widgets/location_card.dart';

part 'widgets/owner_details_list.dart';

part 'widgets/attendee_details_list.dart';

class SalonProfilePage extends StatelessWidget {
  const SalonProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<SalonProfilePageRepository>(
      create: (context) => FirebaseSalonProfilePageRepository(),
      child: BlocProvider(
        create: (context) => SalonProfilePageCubit(
            RepositoryProvider.of<SalonProfilePageRepository>(context)),
        child: BlocListener<SalonProfilePageCubit, SalonProfilePageState>(
          listener: (context, state) {
            if (state is GotoLoginPage) {
              // Navigate to Login page
              Navigator.pushReplacementNamed(context, Routes.root);
            } else if (state is GotoEditProfilePage) {
              Navigator.pushNamed(context, Routes.salonEditProfilePage,
                  arguments: state.salonProfileInfo);
            } else if (state is ShowToast) {
              Fluttertoast.showToast(
                  msg: state.message, toastLength: Toast.LENGTH_SHORT);
            }
          },
          child: Scaffold(
            appBar: _appBar,
            body: SafeArea(
              child: BlocBuilder<SalonProfilePageCubit, SalonProfilePageState>(
                buildWhen: (previousState, state) {
                  return state is LoadSalonProfile;
                },
                builder: (context, state) {
                  if (state is LoadSalonProfile) {
                    return ScrollConfiguration(
                      behavior: NoOverscrollBehaviour(),
                      child: const SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SalonOverview(),
                            Dividers.lightDivider,
                            BasicsCard(),
                            AvailabilityCard(),
                            Dividers.lightDivider,
                            LocationCard(),
                            Dividers.lightDivider,
                            OwnerDetailsList(),
                            AttendeeDetailsList(),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
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
