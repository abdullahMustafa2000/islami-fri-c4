// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  String channelName = 'اذاعة القران الكريم';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset('assets/images/img_radio.png'),
            ),
            Expanded(
              child: Text(
                channelName,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioButton(Icons.skip_previous_rounded, onPrevClick),
                  RadioButton(Icons.play_arrow_rounded, onPlayPauseClick),
                  RadioButton(Icons.skip_next_rounded, onNextClick),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onPrevClick() {
    print('onPrevClick');
  }

  onPlayPauseClick() {
    print('onPlayPauseClick');
  }

  onNextClick() {
    print('onNextClick');
  }
}

class RadioButton extends StatefulWidget {
  Function onBtnClick;
  IconData icon;

  RadioButton(this.icon, this.onBtnClick);
  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onBtnClick();
      },
      child: Icon(
        widget.icon,
        size: 45,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
