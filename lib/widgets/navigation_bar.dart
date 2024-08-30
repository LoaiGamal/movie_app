import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/main_screen.dart';
import 'package:movie_app/screens/now_playing_screen.dart';
import 'package:movie_app/screens/top_rated_screen.dart';
import 'package:movie_app/screens/upcoming_screen.dart';
import 'package:movie_app/translations/locale_keys.g.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() {
    return _MainNavigationBar();
  }
}

class _MainNavigationBar extends State<MainNavigationBar> {
  int _currentIndex = 0;
  Widget _currentScreen = MainScreen(screenName: LocaleKeys.top_rated.tr());
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageStorage(bucket: bucket, child: _currentScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => onDestinationSelected(index),
        currentIndex: _currentIndex,
        items: destinations(),
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  void onDestinationSelected(int index) {
    setState(() {
      switch(index){
        case 0:
          _currentIndex = index;
          _currentScreen = TopRatedScreen(screenName: LocaleKeys.top_rated.tr());
          break;
        case 1:
          _currentIndex = 1;
          _currentScreen = NowPlayingScreen(screenName: LocaleKeys.now_playing.tr());
          break;
        case 2:
          _currentIndex = 2;
          _currentScreen = UpcomingScreen(screenName: LocaleKeys.upcoming.tr());
          break;
      }
    });
  }

  List<BottomNavigationBarItem> destinations() {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.star),
        label: LocaleKeys.top_rated.tr(),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.play_circle_outline),
        label: LocaleKeys.now_playing.tr(),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.update),
        label: LocaleKeys.upcoming.tr(),
      ),
    ];
  }

  List<MainScreen> tabs() {
    return [
      MainScreen(screenName: LocaleKeys.top_rated.tr()),
      MainScreen(screenName: LocaleKeys.now_playing.tr()),
      MainScreen(screenName: LocaleKeys.upcoming.tr()),
    ];
  }
}
