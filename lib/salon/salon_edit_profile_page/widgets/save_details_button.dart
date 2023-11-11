part of '../salon_edit_profile_page.dart';

class SaveDetailsButton extends StatelessWidget {
  const SaveDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    late var bloc = context.read<SalonEditProfilePageBloc>();

    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 23),
      child: ElevatedButton(
        onPressed: () {
          bloc.add(const SaveDetailsButtonClicked());
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child:
            BlocBuilder<SalonEditProfilePageBloc, SalonEditProfilePageState>(
          builder: (context, state) {
            if (state is Loading) {
              return const CircularProgressIndicator(color: Colors.white);
            } else {
              return const Text(
                Strings.saveDetailsUpperCase,
                style: TextStyleConstants.button,
              );
            }
          },
        ),
      ),
    );
  }
}
