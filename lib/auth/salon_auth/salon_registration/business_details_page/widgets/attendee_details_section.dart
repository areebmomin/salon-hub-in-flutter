part of '../business_details_page.dart';

class AttendeeDetails extends StatelessWidget {
  const AttendeeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    late var bloc = context.read<SalonRegistrationBloc>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, top: 32),
            child: const Text(
              Strings.attendeeDetails,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.headingTextColor,
              ),
            ),
          ),
          BlocBuilder<SalonRegistrationBloc, SalonRegistrationState>(
            buildWhen: (previousState, state) {
              return state is AttendeeDetailsListUpdated;
            },
            builder: (context, state) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                prototypeItem: AttendeeDetailsListItem(bloc, 0),
                itemCount: bloc.data.attendeeDetailList.length,
                itemBuilder: (BuildContext context, int index) {
                  return AttendeeDetailsListItem(bloc, index);
                },
              );
            },
          ),
          TextButton(
            onPressed: () {
              bloc.add(const AddAttendee());
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.inputFieldBackground,
              fixedSize: const Size(42, 46),
            ),
            child: const Icon(
              Icons.add_rounded,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}

class AttendeeDetailsListItem extends StatelessWidget {
  final SalonRegistrationBloc bloc;
  final int index;

  const AttendeeDetailsListItem(this.bloc, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child:
                    BlocBuilder<SalonRegistrationBloc, SalonRegistrationState>(
                  buildWhen: (previousState, state) {
                    return state is AttendeePhotoSelected &&
                        state.index == index;
                  },
                  builder: (context, state) {
                    return CircleAvatar(
                      backgroundImage: _getBackgroundImage(state),
                      radius: 40,
                    );
                  },
                ),
              ),
              Positioned(
                top: 70,
                left: 67,
                child: GestureDetector(
                  onTap: () {
                    bloc.add(SetAttendeePhoto(index));
                  },
                  child: const Icon(Icons.add_a_photo, size: 24),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyleConstants.textFieldHint,
                    hintText: Strings.name,
                  ),
                  onChanged: (name) {
                    bloc.data.attendeeDetailList[index].name = name;
                  },
                ),
                if (index > 0) _getCloseButton(bloc, index),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider<Object>? _getBackgroundImage(SalonRegistrationState state) {
    return state is AttendeePhotoSelected
        ? FileImage(state.profilePicture) as ImageProvider<Object>?
        : const AssetImage(Assets.userProfileDummy);
  }

  Widget _getCloseButton(SalonRegistrationBloc bloc, int index) {
    return SizedBox(
      height: 108,
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            bloc.add(RemoveAttendee(index));
          },
          child: Icon(
            Icons.close_rounded,
            size: 22,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
