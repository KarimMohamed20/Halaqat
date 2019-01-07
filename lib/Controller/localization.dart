import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
   * Author: Karim Mohamed
   * Email: karimmohamed200510@gmail.com
   * Function: Localization To Setup Languages
   * Date: 02/01/2019
*/



class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  Map<String, String> _sentences;
  SharedPreferences preferences;
  var dir = TextDirection.ltr;
  Future ifLangCodeNull() async {
    preferences = await SharedPreferences.getInstance();

    if (preferences.getString('code') == null) {
      preferences.setString('code', locale.languageCode);
      preferences.commit();
    }
  }

  

  Future<bool> load() async {
    await ifLangCodeNull();
    String data = await rootBundle.loadString(
        'assets/languages/${preferences.getString('code').toString()}.json');
    Map<String, dynamic> _result = json.decode(data);

    this._sentences = new Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });

    return true;
  }

  Future<bool> loadLang(String code) async {
    String data = await rootBundle.loadString('assets/languages/$code.json');
    preferences = await SharedPreferences.getInstance();
    preferences.setString('code', code);
    preferences.commit();
    Map<String, dynamic> _result = json.decode(data);

    this._sentences = new Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });

    return true;
  }

  String trans(String key) {
    return this._sentences[key];
  }

}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) async {
    DemoLocalizations localizations = new DemoLocalizations(locale);
    await localizations.load();

    print("Load ${locale.languageCode}");

    return localizations;
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
