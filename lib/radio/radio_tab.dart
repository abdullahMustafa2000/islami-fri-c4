// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:islami_fri/api_service/api_service.dart';
import 'package:islami_fri/modules/radio_module.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  var channelIndex = 0;

  APIService get apiService => GetIt.I<APIService>();
  String channelName = '';
  bool _isLoading = false;
  List<RadioModule> channelsList = [];

  fetchChannels() async {
    setState(() {
      _isLoading = true;
    });

    channelsList = await apiService.getRadioChannels();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    fetchChannels();
    super.initState();
  }

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
                channelsList.isEmpty? 'channels' : channelsList[channelIndex].Name,
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
    channelIndex = channelIndex == 0? channelsList.length -1: --channelIndex;
    channelName = channelsList[channelIndex].Name;
    setState(() {

    });
  }

  onPlayPauseClick() {
    print('onPlayPauseClick');
  }

  onNextClick() {
    channelIndex = channelIndex == channelsList.length -1? 0: ++channelIndex;
    channelName = channelsList[channelIndex].Name;
    setState(() {

    });
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
