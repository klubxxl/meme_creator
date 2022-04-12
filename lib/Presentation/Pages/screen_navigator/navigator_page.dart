import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/Presentation/Pages/home/home_page_builder.dart';
import 'package:meme_creator/Presentation/Pages/onboarding/onboarding_page.dart';
import 'package:meme_creator/Presentation/Pages/login/login_page_builder.dart';
import 'package:meme_creator/Presentation/Pages/registration/registration_page_builder.dart';
import 'package:meme_creator/Presentation/Pages/screen_navigator/bloc/my_navigator_bloc.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<MyNavigatorBloc>(
      create: (context) => MyNavigatorBloc(),
      child: BlocBuilder<MyNavigatorBloc, MyNavigatorState>(
        builder: (BuildContext context, state) {
          late Widget page;
          if (state is RegistrationPageState) {
            page = const RegistrationPageBuilder();
          } else if (state is LoginPageState) {
            page = const LoginPageBuilder();
          } else if (state is HomePageState) {
            page = HomePageBuilder(userId: state.userId);
          } else {
            page = const OnboardingScreen();
          }
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 240),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: page,
          );
        },
      ));
}
