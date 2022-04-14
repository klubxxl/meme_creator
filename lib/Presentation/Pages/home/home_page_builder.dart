import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/Injectable/injectable.dart';
import 'package:meme_creator/Presentation/Pages/home/bloc/homepage_bloc.dart';
import 'package:meme_creator/Presentation/Pages/home/home_page.dart';

class HomePageBuilder extends StatelessWidget {
  const HomePageBuilder({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomepageBloc>(
      create: (context) =>
          getIt<HomepageBloc>()..add(const FetchMemesDataEvent()),
      child: HomePage(userId: userId),
    );
  }
}
