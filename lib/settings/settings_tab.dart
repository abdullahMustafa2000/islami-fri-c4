import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_fri/app_provider/my_themes.dart';
import 'package:islami_fri/storage_preference/preference_class.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(appLocalization.settings_tab, textAlign: TextAlign.center,),
          ModeSettings(),
          //LanguageSettings(),
        ],
      ),
    );
  }
}

class ModeSettings extends StatefulWidget {

  @override
  State<ModeSettings> createState() => _ModeSettingsState();
}

class _ModeSettingsState extends State<ModeSettings> {
  var value;
  modeValue() {
    StorageManager.readData('themeMode').then((value) => this.value = value);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Dark mode', style: TextStyle(fontSize: 24),),
              buildSwitch(provider),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSwitch(MyAppProvider provider) => Transform.scale(
    scale: 1.2,
    child: Switch(
      value: provider.isDark(context),
      onChanged: (newValue) {
        setState(() {
          value = newValue;
          provider.toggleTheme(value);
        });
      },


      activeTrackColor: MyDarkColors.colorYellow,
      activeThumbImage: const AssetImage('assets/images/moon_white.png',),
      activeColor: Colors.white,

      inactiveThumbImage: const AssetImage('assets/images/moon_black.png',),
      inactiveThumbColor: Colors.black,
    ),
  );
}



