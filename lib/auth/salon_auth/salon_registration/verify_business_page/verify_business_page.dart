import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../../utils/index.dart';
import '../bloc/salon_registration_bloc.dart';

part 'widgets/close_button.dart';

part 'widgets/verify_business_heading.dart';

part 'widgets/email_text_field.dart';

part 'widgets/password_text_field.dart';

part 'widgets/register_now_button.dart';

class VerifyBusinessPage extends StatelessWidget {
  const VerifyBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<SalonRegistrationBloc>(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CloseButton(),
              const VerifyBusinessHeading(),
              Expanded(
                child: ScrollConfiguration(
                  behavior: NoOverscrollBehaviour(),
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: const IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              RegisterEmailTextField(),
                              PasswordTextField(),
                              RegisterNowButton(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
