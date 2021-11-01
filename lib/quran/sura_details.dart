// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_fri/app_provider/my_themes.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    loadSuraDetails(args.suraIndex);
    return Stack(
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
              args.suraName,
            ),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
              margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)),
              child: verses.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      separatorBuilder: (buildContext, index) {
                        return Container(
                          height: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          width: double.infinity,
                          color: Theme.of(context).primaryColor,
                        );
                      },
                      itemBuilder: (buildContext, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            verses[index] + '{${index + 1}}',
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        );
                      },
                      itemCount: verses.length,
                    )),
        ),
      ],
    );
  }

  void loadSuraDetails(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
//   print(fileContent);
    List<String> ayat = fileContent.split('\n');
    verses = ayat;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String suraName;
  int suraIndex;

  SuraDetailsArgs(this.suraName, this.suraIndex);
}
