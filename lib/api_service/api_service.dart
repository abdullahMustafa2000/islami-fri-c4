import 'dart:convert';

import 'package:islami_fri/modules/radio_module.dart';
import 'package:http/http.dart' as http;
import 'package:islami_fri/modules/radio_response.dart';

class APIService {

  static const String baseUrl = 'http://mp3quran.net/api/';

  Future<List<RadioModule>> getRadioChannels() async {
    final response = await http.get(baseUrl + 'radio/radio_ar.json');
    if (response.statusCode == 200) {
      return apiSucceed(response).channelsList;
    }
    return [];
  }

  RadioResponse apiSucceed(http.Response response) {
    final arabicData = json.decode(utf8.decode(response.bodyBytes))['Radios'];
    print(arabicData);
    List<RadioModule> channelsList = [];
    for(var item in arabicData) {
      channelsList.add(RadioModule(item['Name'], item['URL']));
    }
    return RadioResponse(channelsList);
  }

}