import 'dart:io';

import 'package:Halaqat/Controller/Navigations.dart';
import 'package:Halaqat/Controller/localization.dart';
import 'package:flutter/material.dart';

class LoadLanguages {
  /*
     * Author: Karim Mohamed
     * Email: karimmohamed200510@gmail.com
     * Function: To Change Languages and Show Alerts
  */
  static Locale locale;
  var dir = TextDirection.ltr;
  // Navigation Controller //
  var navigations = NavigationToPages();

  // Load Arabic Language and Alert //
  void loadArabic(cntx) async {
    await DemoLocalizations.of(cntx).loadLang('ar');
    // Alert to Restart Language //
    showDialog(
        context: cntx,
        child: AlertDialog(
          title: new Text(DemoLocalizations.of(cntx).trans('alertTitle'),
          textDirection: dir,),
          content: Text(DemoLocalizations.of(cntx).trans('alertContent'),
          textDirection: TextDirection.rtl,),
          actions: <Widget>[
            FlatButton(
              child: new Text(DemoLocalizations.of(cntx).trans('go'),
          textDirection: dir,),
              onPressed: () {exit(0);},
            )
          ],
        ));
  }

  // Load English Language and Alert
  void loadEnglish(cntx) async {
    // Load English
    await DemoLocalizations.of(cntx).loadLang('en');
    // Alert to Restart Language
    showDialog(
        context: cntx,
        child: AlertDialog(
          title: new Text(DemoLocalizations.of(cntx).trans('alertTitle'),
          textDirection: dir,),
          content: Text(DemoLocalizations.of(cntx).trans('alertContent'),
          textDirection: dir,),
          actions: <Widget>[
            FlatButton(
              child: new Text(DemoLocalizations.of(cntx).trans('go'),
          textDirection: dir,),
              onPressed: () {exit(0);},
            )
          ],
        ));
  }

  // Load French Language and Alert
  void loadFrench(cntx) async {
    // Load French
    await DemoLocalizations.of(cntx).loadLang('fr');
    // Alert to Restart Language
    showDialog(
        context: cntx,
        child: AlertDialog(
          title: new Text(
            DemoLocalizations.of(cntx).trans('alertTitle'),
            textDirection: dir,
          ),
          content: Text(
            DemoLocalizations.of(cntx).trans('alertContent'),
            textDirection: dir,
          ),
          actions: <Widget>[
            FlatButton(
              child: new Text(
                DemoLocalizations.of(cntx).trans('go'),
                textDirection: dir,
              ),
              onPressed: () {exit(0);},
            )
          ],
        ));
  }
}
