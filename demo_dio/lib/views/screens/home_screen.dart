import 'package:demo_dio/controller/weather_controller.dart';
import 'package:demo_dio/helper/dio_api.dart';
import 'package:demo_dio/modal/weather_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Dio"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<WeatherController>(builder: (context, pro, _) {
          return ListView.builder(
              itemCount: pro.allData.length,
              itemBuilder: (context, index) {
                WeatherModel weatherModel = pro.allData[index];
                return ListTile(
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      pro.deleteUser();
                    },
                  ),
                  subtitle: Text(weatherModel.content),
                  title: Text(weatherModel.email),
                );
              });
        }),
      ),
    );
  }
}
