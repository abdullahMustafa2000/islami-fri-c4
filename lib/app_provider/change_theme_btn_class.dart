// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:islami_fri/app_provider/my_themes.dart';
import 'package:provider/provider.dart';

class ChangeThemeBtnWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<MyAppProvider>(context);

    return Switch.adaptive(
        value: themeProvider.isDark(context),
        onChanged: (value) {
          final provider = Provider.of<MyAppProvider>(context, listen: false);
          provider.toggleTheme(value);
        },
    );
  }
}
