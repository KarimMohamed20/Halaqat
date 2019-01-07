import 'package:Halaqat/Controller/localization.dart';
import 'package:flutter/material.dart';
import 'package:Halaqat/Controller/Navigations.dart';
import 'package:Halaqat/Controller/sqliteLoad.dart';
/*
      * Author: Karim mohamed 
      * created: 1/1/2019
      * Screen: Main screen that app start from 
*/

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // DATABASE CONTROLLER
  var db = DBHelper();
  // NAVIGATORS CONTROLLER
  var navigation = NavigationToPages();

  // METHOD TO LOAD FUNCTIONS WHEN PAGE LOAD //
  @override
  void initState() {
    super.initState();
    // Print From Local Database //
    db.getSuraTable().then((list) {
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Drawer that All App will use //
    final Drawer drawer = new Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: new Text(DemoLocalizations.of(context).trans('title_main')),
            leading: new Image.asset("assets/images/home.png"),
          ),
          ListTile(
            title:
                new Text(DemoLocalizations.of(context).trans('title_mus7af')),
            leading: new Image.asset("assets/images/mus7af.png"),
          ),
          ListTile(
            title: new Text(
                DemoLocalizations.of(context).trans('title_downloads')),
            leading: new Image.asset("assets/images/download.png"),
          ),
          ListTile(
            title: new Text(
                DemoLocalizations.of(context).trans('title_attendance')),
            leading: new Image.asset("assets/images/attendance.png"),
          ),
          ListTile(
            title:
                new Text(DemoLocalizations.of(context).trans('title_report')),
            leading: new Image.asset("assets/images/reports.png"),
          ),
          ListTile(
            title: new Text(DemoLocalizations.of(context).trans('title_exams')),
            leading: new Image.asset("assets/images/exams.png"),
          ),
          ListTile(
            title:
                new Text(DemoLocalizations.of(context).trans('title_survey')),
            leading: new Image.asset("assets/images/survey.png"),
          ),
          ListTile(
            title: new Text(DemoLocalizations.of(context).trans('title_chat')),
            leading: new Image.asset("assets/images/chat.png"),
          ),
          ListTile(
            title: new Text(DemoLocalizations.of(context).trans('title_notes')),
            leading: new Image.asset("assets/images/notes.png"),
          ),
          ListTile(
            title:
                new Text(DemoLocalizations.of(context).trans('title_market')),
            leading: new Image.asset("assets/images/market.png"),
          ),
          ListTile(
            title:
                new Text(DemoLocalizations.of(context).trans('title_rewards')),
            leading: new Image.asset("assets/images/upwords.png"),
          ),
          ListTile(
            title: new Text(
                DemoLocalizations.of(context).trans('title_competitions')),
            leading: new Image.asset("assets/images/competitions.png"),
          ),
          ListTile(
            title: new Text(
                DemoLocalizations.of(context).trans('title_activities')),
            leading: new Image.asset("assets/images/activities.png"),
          ),
          ListTile(
            title:
                new Text(DemoLocalizations.of(context).trans('title_courses')),
            leading: new Image.asset("assets/images/courses.png"),
          ),
          ListTile(
            title: new Text(DemoLocalizations.of(context).trans('title_live')),
            leading: new Image.asset("assets/images/live.png"),
          ),
          ListTile(
            title: new Text(
                DemoLocalizations.of(context).trans('title_invitations')),
            leading: new Image.asset("assets/images/invitations.png"),
          ),
          ListTile(
            title:
                new Text(DemoLocalizations.of(context).trans('title_gallery')),
            leading: new Image.asset("assets/images/gallery.png"),
          ),
          ListTile(
            title: new Text(
                DemoLocalizations.of(context).trans('title_certifications')),
            leading: new Image.asset("assets/images/certifications.png"),
          ),
          ListTile(
            title: new Text(DemoLocalizations.of(context).trans('title_my_id')),
            leading: new Image.asset("assets/images/my_id.png"),
          ),
          ListTile(
            title:
                new Text(DemoLocalizations.of(context).trans('title_support')),
            leading: new Image.asset("assets/images/support.png"),
          ),
          ListTile(
            title: new Text(
                DemoLocalizations.of(context).trans('title_exchange_account')),
            leading: new Image.asset("assets/images/exchange.png"),
          ),
          ListTile(
            title:
                new Text(DemoLocalizations.of(context).trans('title_logout')),
            leading: new Image.asset("assets/images/logout.png"),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
          title: new Text(
        DemoLocalizations.of(context).trans('hello'),
      )),
      drawer: drawer,
      body: Center(
        child: RaisedButton(
          child: new Text(
            DemoLocalizations.of(context).trans('hello'),
          ),
          onPressed: () => navigation.navigateToSettings(context, drawer),
        ),
      ),
    );
  }
}
