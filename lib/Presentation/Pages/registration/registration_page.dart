import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meme_creator/presentation/pages/registration/bloc/registration_bloc.dart';
import 'package:meme_creator/presentation/pages/screen_navigator/bloc/my_navigator_bloc.dart';
import 'package:meme_creator/presentation/style/dimens.dart';
import 'package:meme_creator/presentation/style/images.dart';
import 'package:meme_creator/presentation/widgets/meme_button.dart';
import 'package:meme_creator/presentation/widgets/screen_footer_with_button.dart';
import 'package:meme_creator/presentation/widgets/screen_headline.dart';
import 'package:meme_creator/presentation/widgets/registration_text_field.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.m),
              child: BlocConsumer<RegistrationBloc, RegistrationState>(
                buildWhen: (previous, current) =>
                    current is RegistrationInitialState ||
                    current is RegistrationFormInvalidState ||
                    current is RegistrationFormValidState,
                listenWhen: (previous, current) =>
                    current is RegistrationLoadingState ||
                    current is RegistrationErrorState ||
                    current is RegistrationSuccessState,
                listener: (context, state) {
                  if (state is RegistrationErrorState) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.errorText)));
                  }
                  if (state is RegistrationLoadingState) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Submitting...')));
                  }
                  if (state is RegistrationSuccessState) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registration success!')));
                    context
                        .read<MyNavigatorBloc>()
                        .add(const MyHomePageOpenningEvent());
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: Dimens.xxxxl),
                      PageHeadline(),
                      const SizedBox(height: Dimens.ms),
                      TextFormRegistration(
                        title: 'Email',
                        formText: 'Your email',
                        onChanged: (email) {
                          context
                              .read<RegistrationBloc>()
                              .add(RegistrationEmailChangedEvent(email));
                        },
                        errorMessage: _getEmailText(state),
                      ),
                      const SizedBox(height: Dimens.m),
                      TextFormRegistration(
                        title: 'Password',
                        formText: 'Create your password',
                        imageOn: Image.asset(Images.passwordStateOn),
                        imageOff: Image.asset(Images.passwordStateOff),
                        onChanged: (password) {
                          context
                              .read<RegistrationBloc>()
                              .add(RegistrationPasswordChangedEvent(password));
                        },
                        errorMessage: _getPasswordText(state),
                      ),
                      const SizedBox(height: Dimens.l),
                      MemeButton(
                        onTap: () {
                          context
                              .read<RegistrationBloc>()
                              .add(const RegistrationFormSubmittedEvent());
                        },
                        isActive: _isButtonEnable(state),
                      ),
                      const SizedBox(height: Dimens.m),
                      ScreenFooter(
                        text: 'Already have an account? ',
                        buttonText: "Log in",
                        onTapButton: () {
                          context
                              .read<MyNavigatorBloc>()
                              .add(const MyRegistrationButtonEvent());
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );

  String? _getPasswordText(RegistrationState state) {
    if (state is RegistrationFormInvalidState) {
      return state.passwordErrorText;
    } else {
      return null;
    }
  }

  String? _getEmailText(RegistrationState state) {
    if (state is RegistrationFormInvalidState) {
      return state.emailErrorText;
    } else {
      return null;
    }
  }

  bool _isButtonEnable(RegistrationState state) {
    if (state is RegistrationFormInvalidState ||
        state is RegistrationInitialState) {
      return false;
    } else {
      return true;
    }
  }
}
