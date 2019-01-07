import 'package:Halaqat/Controller/localization.dart';
import 'package:flutter/material.dart';
import 'package:Halaqat/View/HomePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
 * Author Karim mohamed
 * created @ 1/1/2019
 * Main screen that app start from
 * contains declaration of languages as const
 */
void main() => runApp(MaterialStarter());

class MaterialStarter extends StatefulWidget {
  @override
  _MaterialStarterState createState() => _MaterialStarterState();
}

class _MaterialStarterState extends State<MaterialStarter> {
  SharedPreferences sharedPreferences;
  Locale locale = Locale('en');
  void switchDir() async {
    SharedPreferences preferences;
    preferences = await SharedPreferences.getInstance();
    setState(() {});
    switch (preferences.getString('code')) {
      case 'en':
        {
          setState(() {
            locale = Locale('en');
          });
        }
        break;
      case 'fr':
        {
          setState(() {
            locale = Locale('fr');
          });
        }
        break;
      case 'ar':
        {
          setState(() {
            locale = Locale('ar');
          });
        }
    }
  }
  @override
    void initState() {
      super.initState();
      switchDir();
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
      supportedLocales: [
        const Locale('ar', ''),
        const Locale('en', 'US'),
        const Locale('fr', ''),
      ],
      locale: locale,
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }

        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
