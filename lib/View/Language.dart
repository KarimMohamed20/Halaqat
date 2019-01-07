import 'package:Halaqat/Controller/localization.dart';
import 'package:flutter/material.dart';
import 'package:Halaqat/Controller/loadLanguages.dart';

/*
   * Author: Karim Mohamed
   * Email: karimmohamed200510@gmail.com
   * Function: Language Page
*/

class Language extends StatefulWidget {
  final Drawer drawer;
  Language({this.drawer});

  @override
  LanguageState createState() {
    return new LanguageState();
  }
}

class LanguageState extends State<Language> {
  var loadLanguages = LoadLanguages();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: widget.drawer,
      appBar: AppBar(
        title: new Text(
          DemoLocalizations.of(context).trans('hello'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new RaisedButton(
            child: new Text('English'),
            onPressed: () {
              LoadLanguages().loadEnglish(context);
            },
          ),
          new RaisedButton(
            child: new Text('عربى'),
            onPressed: () {
              LoadLanguages().loadArabic(context);
            },
          ),
          new RaisedButton(
            child: new Text('français'),
            onPressed: () {
              LoadLanguages().loadFrench(context);
            },
          ),
        ],
      ),
    );
  }
}
