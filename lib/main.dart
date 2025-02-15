import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:eQuran/home/library.dart' show HomePage;
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'backend/library.dart'
    show
        BookmarkDB,
        FavouritesDB,
        ReadingEntryAdapter,
        SettingsDB,
        SurahAdapter,
        SurahDB;

Future<void> main() async {
  // ----- HIVE -----
  await Hive.initFlutter();

  Hive.registerAdapter(SurahAdapter());
  Hive.registerAdapter(ReadingEntryAdapter());

  // Hive.deleteBoxFromDisk("bookmarks");

  await BookmarkDB().initBox();
  await SettingsDB().initBox();
  await SurahDB().initBox();
  await FavouritesDB().initBox();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static MaterialColor mySeed = _getPrimaryColor();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: mySeed, brightness: Brightness.light)),
        dark: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: mySeed, brightness: Brightness.dark)),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp(
              scrollBehavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              home: const HomePage(),
            ));
  }

  static MaterialColor _getPrimaryColor() {

    return  Colors.primaries[8] ;
  }
}
