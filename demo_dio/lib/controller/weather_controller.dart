import 'package:demo_dio/helper/dio_api.dart';
import 'package:demo_dio/modal/weather_modal.dart';
import 'package:flutter/cupertino.dart';

class WeatherController extends ChangeNotifier {
  WeatherModel? weatherModel;

  List allData = [];

  WeatherController() {
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    allData = await ApiHelper.apiHelper.getData();
    notifyListeners();
  }

  Future<void> deleteUser() async {
    try {
      await ApiHelper.apiHelper.deleteData(weatherModel!.id);
      notifyListeners();
    } catch (e) {
      print("ERROR:$e");
    }
  }
}
