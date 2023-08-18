part of '../business_details_page.dart';

class AttendeeDetailsWidget extends StatefulWidget {
  const AttendeeDetailsWidget({super.key});

  @override
  State<AttendeeDetailsWidget> createState() => _AttendeeDetailsWidgetState();
}

class _AttendeeDetailsWidgetState extends State<AttendeeDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    SaloonRegistrationCubit cubit = context.read<SaloonRegistrationCubit>();

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
          BlocBuilder<SaloonRegistrationCubit, SaloonRegistrationState>(
            buildWhen: (previousState, state) {
              return state is SaloonRegistrationAttendeeDetailsListUpdated;
            },
            builder: (context, state) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cubit.data.attendeeDetailList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 12, bottom: 12),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(Assets.userProfileDummy),
                                radius: 40,
                              ),
                            ),
                            Positioned(
                              top: 70,
                              left: 67,
                              child: GestureDetector(
                                onTap: () {
                                  //context.read<SaloonRegistrationCubit>().data.address = address;
                                },
                                child: const Icon(
                                  Icons.add_a_photo,
                                  size: 24,
                                ),
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
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: AppColors.inputText,
                                  ),
                                  hintText: Strings.name,
                                ),
                                onChanged: (name) {
                                  cubit.data.attendeeDetailList[index].name = name;
                                },
                              ),
                              if (index > 0) _getCloseButton(cubit, index),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          TextButton(
            onPressed: () {
              cubit.addNewAttendee();
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

  Widget _getCloseButton(SaloonRegistrationCubit cubit, int index) {
    return SizedBox(
      height: 108,
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            cubit.removeAttendee(index);
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
