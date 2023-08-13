part of '../business_details_page.dart';

class OwnerDetailsWidget extends StatefulWidget {
  const OwnerDetailsWidget({super.key});

  @override
  State<OwnerDetailsWidget> createState() => _OwnerDetailsWidgetState();
}

class _OwnerDetailsWidgetState extends State<OwnerDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    SaloonRegistrationCubit cubit = context.read<SaloonRegistrationCubit>();

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, top: 32),
          child: RichText(
            text: const TextSpan(
              text: Strings.ownerDetails,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.headingTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: Strings.asterisk,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: cubit.data.ownerDetailsList.asMap().entries.map(
            (e) {
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
                              //context.read<SaloonRegistrationCubit>().data.address = name.trim();
                            },
                          ),
                          SizedBox(
                            height: 108,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  //context.read<SaloonRegistrationCubit>().data.address = address;
                                },
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 22,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
        TextButton(
          onPressed: () {
            //context.read<SaloonRegistrationCubit>().data.address = address;
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
    );
  }
}
