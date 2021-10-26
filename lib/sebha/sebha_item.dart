// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SebhaItem extends StatefulWidget {

  Function onSebhaTab;


  SebhaItem(this.onSebhaTab);

  @override
  State<SebhaItem> createState() => _SebhaItemState();
}

class _SebhaItemState extends State<SebhaItem> with TickerProviderStateMixin {

  late AnimationController _controller;

  double start = 0.0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 700),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: RotationTransition(
        turns: Tween(begin: start, end: start+=0.03).animate(_controller),
        child: Image.asset('assets/images/img_sebha.png',
          height: height * 0.4,
          color: Theme.of(context).colorScheme.primary,),
      ),
      onTap: (){
        widget.onSebhaTab();
      },
    );
  }
}



