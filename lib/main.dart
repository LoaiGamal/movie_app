import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/screens/language_screen.dart';
import 'package:movie_app/translations/codegen_loader.g.dart';
import 'package:movie_app/widgets/navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      theme: theme,
      // home: const Temp(),
      home: const MainNavigationBar(),
    );
  }
}

final theme = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      titleLarge: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      titleMedium: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      titleSmall: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      bodyLarge: const TextStyle(color: Colors.white, fontSize: 18),
      bodyMedium: const TextStyle(color: Colors.white, fontSize: 16),
      bodySmall: const TextStyle(color: Colors.white, fontSize: 14),
    ),
    colorScheme: const ColorScheme.dark(
        onPrimary: Color(0xFFFFC700), brightness: Brightness.dark));
