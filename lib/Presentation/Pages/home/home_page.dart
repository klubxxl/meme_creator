import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meme_creator/Presentation/Pages/home/bloc/homepage_bloc.dart';
import 'package:meme_creator/Presentation/Pages/home/community_memes_screen.dart';
import 'package:meme_creator/Presentation/Pages/home/my_memes_screen.dart';
import 'package:meme_creator/Presentation/Style/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageBloc, HomepageState>(
      buildWhen: (previous, current) =>
          current is HomepageFirst || current is HomepageSeccond,
      builder: (context, state) {
        return Scaffold(
          body: state is HomepageFirst
              ? MyMemesPage(state)
              : CommunityMemesPage(state),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SizedBox(
            height: 70,
            width: 70,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: MemeColors.mainColorDark,
                child: const FittedBox(
                  child: Icon(
                    Icons.add,
                    color: MemeColors.grey,
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              elevation: 40,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.attractions_outlined),
                  activeIcon: Icon(Icons.attractions),
                  label: 'My memes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_outlined),
                  activeIcon: Icon(Icons.people),
                  label: 'Community memes',
                )
              ],
              currentIndex: state.props.first as int,
              selectedItemColor: MemeColors.mainColorDark,
              onTap: (tap) {
                if (tap == 1) {
                  context
                      .read<HomepageBloc>()
                      .add(const ChangeIntoSeccondScreenEvent());
                } else {
                  context
                      .read<HomepageBloc>()
                      .add(const ChangeIntoFirstScreenEvent());
                }
              }),
        );
      },
    );
  }
}
