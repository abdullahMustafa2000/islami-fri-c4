// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_fri/app_provider/my_themes.dart';
import 'package:islami_fri/home_page.dart';
import 'package:islami_fri/quran/sura_details.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => MyAppProvider(),
      builder: (context, _) {
        final provider = Provider.of<MyAppProvider>(context);
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          themeMode: provider.themeMode,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          title: 'Flutter Demo',
          routes: {
            HomePage.routeName: (buildContext) => HomePage(),
            SuraDetailsScreen.routeName: (buildContext) => SuraDetailsScreen()
          },
          initialRoute: HomePage.routeName,

        );
      }
    );
  }
}
