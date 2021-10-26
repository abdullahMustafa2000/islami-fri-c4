// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:islami_fri/sebha/sebha_item.dart';

class SebhaTab extends StatefulWidget {

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbehaCounter = 0;

  int tasbehaIndex = 0;

  String zekr = azkar[0];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SebhaItem(onSebhaTab),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              'عدد التسبيحات',
              style: TextStyle(
                fontSize: 24
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                border: Border.all(),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text(
              tasbehaCounter.toString(),
              style: const TextStyle(
                fontSize: 24
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              zekr,
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.secondaryVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onSebhaTab() {
    tasbehaCounter++;
    print(tasbehaCounter);
    if(tasbehaCounter == 34) {
      tasbehaCounter = 0;
      changeZekr();
    }
    setState(() {

    });
  }

  void changeZekr() {
    tasbehaIndex = tasbehaIndex == azkar.length-1 ? 0 : ++tasbehaIndex;
    zekr = azkar[tasbehaIndex];
  }
}

List<String> azkar = [
  'سبحان الله',
  'الحمد لله',
  'لا اله الا الله',
  'الله أكبر',
];
