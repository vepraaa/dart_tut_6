import 'package:dart_tut_6/dart_tut_6.dart' as dart_tut_6;
import 'package:dio/dio.dart';
import 'cars/cars.dart';
import 'carsmodels/carsmodel.dart';

void main(List<String> arguments) async {
  Dio httpClient = Dio();
  String url = "https://myfakeapi.com/api/cars/";
  var response = await httpClient.get(url);
  Carsmodel carsmodel = Carsmodel.fromJson(response.data);

  List<Cars> yellowCars = Cars.where((cars) => cars.color == "yellow").toList();
  double totalYellowCarsPrice =
      yellowCars.fold(0, (previousValue, car) => previousValue + car.price);
  double averageYellowCarsPrice = totalYellowCarsPrice / yellowCars.length;
  print('Средняя цена желтых машин:$averageYellowCarsPrice');
}
