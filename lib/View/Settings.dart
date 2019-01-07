import 'package:Halaqat/Controller/localization.dart';
import 'package:flutter/material.dart';
import 'package:Halaqat/Controller/Navigations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  final Drawer drawer;
  Settings({@required this.drawer});
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // NAVIGATORS CONTROLLER
  var navigation = NavigationToPages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: widget.drawer,
        appBar: AppBar(
          title: Text(
            DemoLocalizations.of(context).trans('settings'),
          ),
        ),
        body: Center(
          child: RaisedButton(
            child: Text(
              DemoLocalizations.of(context).trans('settings'),
            ),
            onPressed: () =>
                navigation.navigateToLanguage(context, widget.drawer),
          ),
        ));
  }
}
