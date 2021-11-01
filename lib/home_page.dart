// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:islami_fri/app_provider/my_themes.dart';
import 'package:islami_fri/hadeth/HadethTab.dart';
import 'package:islami_fri/quran/quran_tab.dart';
import 'package:islami_fri/radio/radio_tab.dart';
import 'package:islami_fri/sebha/sebha_tab.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_fri/settings/settings_tab.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  Color changeIconColor(int index) {
    return currentPage == index? Theme.of(context).colorScheme.primaryVariant : Colors.white70;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    var appLocalization = AppLocalizations.of(context)!;
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            provider.isDark(context)? 'assets/images/bg_designed_dark.png' : 'assets/images/main_background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text(
                appLocalization.app_title,
              ),
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
              child: BottomNavigationBar(
                onTap: (index) {
                  currentPage = index;
                  setState(() {});
                },
                currentIndex: currentPage,
                items: [
                  BottomNavigationBarItem(
                      label: appLocalization.quran_tab,
                      icon: Image.asset(
                        'assets/images/ic_moshaf.png',
                        width: 36,
                        color: changeIconColor(0),
                      )),
                  BottomNavigationBarItem(
                      label: appLocalization.hadeeth_tab,
                      icon: Image.asset('assets/images/ic_book.png', width: 36,
                        color: changeIconColor(1),)),
                  BottomNavigationBarItem(
                      label: appLocalization.sebha_tab,
                      icon: Image.asset('assets/images/ic_sebha.png', width: 36,
                        color: changeIconColor(2),)),
                  BottomNavigationBarItem(
                      label: appLocalization.radio_tab,
                      icon: Image.asset('assets/images/ic_radio.png', width: 36,
                        color: changeIconColor(3),)),
                  BottomNavigationBarItem(
                      label: appLocalization.settings_tab,
                      icon: Icon(Icons.settings, size: 36,
                        color: changeIconColor(3),)),
                ],
              ),
            ),
            body: Container(child: view[currentPage]),
          ),
        ],
      ),
    );
  }

  List<Widget> view = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];

}
