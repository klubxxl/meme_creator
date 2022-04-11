import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/Presentation/Pages/login/bloc/login_bloc.dart';
import 'package:meme_creator/Presentation/Pages/screenNavigator/bloc/my_navigator_bloc.dart';
import 'package:meme_creator/Presentation/Style/dimens.dart';
import 'package:meme_creator/Presentation/Style/images.dart';
import 'package:meme_creator/Presentation/Widgets/meme_button.dart';
import 'package:meme_creator/Presentation/Widgets/screen_footer_with_button.dart';
import 'package:meme_creator/Presentation/Widgets/screen_headline.dart';
import 'package:meme_creator/Presentation/Widgets/registration_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.m),
              child: BlocConsumer<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    current is LoginInitialState ||
                    current is LoginFormInvalidState ||
                    current is LoginFormValidState,
                listenWhen: (previous, current) =>
                    current is LoginLoadingState ||
                    current is LoginErrorState ||
                    current is LoginSuccessState,
                listener: (context, state) {
                  if (state is LoginErrorState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.errorText)));
                  }
                  if (state is LoginLoadingState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Submitting...')));
                  }
                  if (state is LoginSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Loggining succes!')));
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: Dimens.xxxxl),
                      PageHeadline(
                        title: 'Welcome back! Log in to generate memes.',
                        image: Images.loginEmoi,
                      ),
                      const SizedBox(height: Dimens.ms),
                      TextFormRegistration(
                        title: 'Email',
                        formText: 'Your email',
                        onChanged: (email) {
                          context
                              .read<LoginBloc>()
                              .add(LoginEmailChangedEvent(email));
                        },
                        errorMessage: _getEmailText(state),
                      ),
                      const SizedBox(height: Dimens.m),
                      TextFormRegistration(
                        title: 'Password',
                        formText: 'Your password',
                        imageOn: Image.asset(Images.passwordStateOn),
                        imageOff: Image.asset(Images.passwordStateOff),
                        onChanged: (password) {
                          context
                              .read<LoginBloc>()
                              .add(LoginPasswordChangedEvent(password));
                        },
                        errorMessage: _getPasswordText(state),
                      ),
                      const SizedBox(height: Dimens.l),
                      MemeButton(
                        onTap: () {
                          context
                              .read<LoginBloc>()
                              .add(const LoginFormSubmittedEvent());
                        },
                        isActive: _isButtonEnable(state),
                        title: 'Log in',
                      ),
                      const SizedBox(height: Dimens.m),
                      ScreenFooter(
                        onTapButton: () {
                          context
                              .read<MyNavigatorBloc>()
                              .add(const MyLoginButtonEvent());
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

  String? _getPasswordText(LoginState state) {
    if (state is LoginFormInvalidState) {
      return state.passwordErrorText;
    } else {
      return null;
    }
  }

  String? _getEmailText(LoginState state) {
    if (state is LoginFormInvalidState) {
      return state.emailErrorText;
    } else {
      return null;
    }
  }

  bool _isButtonEnable(LoginState state) {
    if (state is LoginFormInvalidState || state is LoginInitialState) {
      return false;
    } else {
      return true;
    }
  }
}
