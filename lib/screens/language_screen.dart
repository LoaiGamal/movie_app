import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/translations/locale_keys.g.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: appBarTitle(context),
      ),
      body: const Center(
        child: RadioLanguages(),
      ),
    );
  }

  Text appBarTitle(BuildContext context) {
    return Text(
      LocaleKeys.language.tr(),
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 24,
            color: Colors.white,
          ),
    );
  }
}

enum Languages { english, arabic }

class RadioLanguages extends StatefulWidget {
  const RadioLanguages({super.key});

  @override
  State<RadioLanguages> createState() {
    return _RadioLanguagesState();
  }
}

class _RadioLanguagesState extends State<RadioLanguages> {
  Languages? _language = Languages.english;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          languageCard('English', Languages.english),
          languageCard('Arabic', Languages.arabic),
          const SizedBox(
            height: 50,
          ),
          changeLanguage(),
        ],
      ),
    );
  }

  Card languageCard (String title, Languages language){
    return Card(
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white54,
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: Radio<Languages>(
          value: language,
          activeColor: Theme.of(context).colorScheme.onPrimary,
          groupValue: _language,
          onChanged: (Languages? value) {
            setState(() {
              _language = value;
            });
          },
        ),
      ),
    );
  }

  ElevatedButton changeLanguage() {
    return ElevatedButton(
      onPressed: () async {
        if(_language == Languages.english){
          setState(() {
            context.setLocale(const Locale('en'));
          });
        }

        else if(_language == Languages.arabic){
          setState(() {
            context.setLocale(const Locale('ar'));
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Text(
        LocaleKeys.change_language.tr(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
