import 'package:flutter/material.dart';
import 'package:meme_creator/Domain/auth/model/memes.dart';
import 'package:meme_creator/Presentation/Pages/home/bloc/homepage_bloc.dart';

class CommunityMemesPage extends StatelessWidget {
  CommunityMemesPage(this._state, {Key? key}) : super(key: key);

  HomepageState _state;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('elo'),
    );
  }
}
