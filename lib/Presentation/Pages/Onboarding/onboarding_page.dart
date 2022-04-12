import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/presentation/pages/screen_navigator/bloc/my_navigator_bloc.dart';
import 'package:meme_creator/presentation/style/app_typography.dart';
import 'package:meme_creator/presentation/style/dimens.dart';
import 'package:meme_creator/presentation/style/images.dart';
import 'package:meme_creator/presentation/widgets/meme_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: Dimens.xxxl),
                Image.asset(Images.onboardImage),
                const SizedBox(height: Dimens.l),
                const Text(
                  'Here you can generate the coolest memes!',
                  style: Topography.h1,
                ),
                const SizedBox(height: Dimens.m),
                Text(
                  'Easily add text to images and become a meme king at Flutter Academy 😅',
                  style: Topography.body1.copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: Dimens.l),
                MemeButton(
                  onTap: () => context
                      .read<MyNavigatorBloc>()
                      .add(const MyOnboardingEvent()),
                  title: 'Start',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
