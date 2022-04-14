import 'package:flutter/material.dart';
import 'package:meme_creator/Presentation/Pages/home/bloc/homepage_bloc.dart';

class MyMemesPage extends StatelessWidget {
  MyMemesPage(this._state, {Key? key}) : super(key: key);

  HomepageState _state;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () async {
            ;
          },
          child: const Text('Upload testmeme')),
    );
  }
}
