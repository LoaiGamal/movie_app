import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/language_screen.dart';
import 'package:movie_app/translations/locale_keys.g.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          drawerHeader(context),
          ListTile(
            leading: const Icon(
              Icons.language,
              color: Colors.white54,
            ),
            title: Text(
              LocaleKeys.language.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ),
            onTap: () {_changeLanguage(context);},
          )
        ],
      ),
    );
  }

  DrawerHeader drawerHeader(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.onPrimary,
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.settings,
            size: 48,
            color: Colors.black54,
          ),
          const SizedBox(width: 20),
          Text(
            LocaleKeys.settings.tr(),
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 40),
          ),
        ],
      ),
    );
  }

  void _changeLanguage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LanguageScreen(),
        ));
  }
}
