import 'package:flutter/material.dart';
import 'package:Halaqat/View/HomePage.dart';
import 'package:Halaqat/View/Language.dart';
import 'package:Halaqat/View/Settings.dart';
class NavigationToPages{

  /* 
      * Author: Karim Mohamed
      * Email: karimmohamed200510@gmail.com
      * Function: Navigations of All App
  */

  void navigateToSettings(BuildContext cntx,Drawer drawer){
    Navigator.of(cntx).push(MaterialPageRoute(
      builder: (cntx) => Settings(
        drawer: drawer,
      )
    ));
  }

  void navigateToHome(BuildContext cntx){
    Navigator.of(cntx).push(MaterialPageRoute(
      builder: (cntx) => MyApp()
    ));
  }

  void navigateToLanguage(BuildContext cntx,Drawer drawer){
    Navigator.of(cntx).push(MaterialPageRoute(
      builder: (cntx)=>Language(
        drawer: drawer,
      )
    ));
  }

}