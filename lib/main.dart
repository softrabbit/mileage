import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polttoainelaskuri',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Polttoaineenkulutuslaskuri'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum CarType { A, B, C }
// Gasoline in liters per 100 km at 1 km/h
var litersper100 = {
  CarType.A: 3,
  CarType.B: 3.5,
  CarType.C: 4,
};
num getMileage(CarType? c, double speed) {
  return litersper100[c]! * pow(1.009, speed - 1);
}

// Return travel time in minutes. Distance in km and speed in km/h
int getTravelTime(num distance, num speed) {
  return ((distance / speed) * 60).floor();
}

// Probably reinventing the wheel but it could maybe be
// un-reinvented later
String PrettyPrintMinutes(int t) {
  int hours = (t / 60).floor();
  int minutes = t - hours * 60;
  return (hours > 0 ? hours.toString() + " h " : "") +
      minutes.toString() +
      " min";
}

class _MyHomePageState extends State<MyHomePage> {
  // Initial values for inputs
  double _distanceValue = 100;
  double _speed1Value = 50;
  double _speed2Value = 80;

  CarType? _selectedCar = CarType.A;
  final TextStyle makeBold = TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // This RadioList thing looks pretty ugly, but it looks
          // like the most obvious ways to make it pretty are broken
          // or too complex. (e.g. they won't work in a Row)
          // Must revisit this later.
          children: <Widget>[
            RadioListTile<CarType>(
              title: const Text('Auto A'),
              value: CarType.A,
              groupValue: _selectedCar,
              onChanged: (CarType? c) {
                setState(() {
                  _selectedCar = c;
                });
              },
            ),
            RadioListTile<CarType>(
              title: const Text('Auto B'),
              value: CarType.B,
              groupValue: _selectedCar,
              onChanged: (CarType? c) {
                setState(() {
                  _selectedCar = c;
                });
              },
            ),
            RadioListTile<CarType>(
              title: const Text('Auto C'),
              value: CarType.C,
              groupValue: _selectedCar,
              onChanged: (CarType? c) {
                setState(() {
                  _selectedCar = c;
                });
              },
            ),
            Text(
              'Matka: $_distanceValue km',
              style: Theme.of(context).textTheme.headline4,
            ),
            Slider(
              onChanged: (double value) {
                setState(() {
                  _distanceValue = value;
                });
              },
              min: 10,
              max: 1000,
              divisions: 99,
              label: "Matka (km)",
              value: _distanceValue,
            ),
            Text(
              'Nopeus 1: $_speed1Value km/h',
              style: Theme.of(context).textTheme.headline4,
            ),
            Slider(
              onChanged: (double value) {
                setState(() {
                  _speed1Value = value;
                });
              },
              min: 50,
              max: 120,
              divisions: 7,
              label: "Nopeus 1 (km/h)",
              value: _speed1Value,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25.0),
              child: Text('Kulutus nopeudella $_speed1Value km/h = ' +
                  getMileage(_selectedCar, _speed1Value).toStringAsFixed(1) +
                  " l / 100 km, yht. " +
                  (getMileage(_selectedCar, _speed1Value) *
                          _distanceValue /
                          100)
                      .toStringAsFixed(1) +
                  " litraa, matka-aika " +
                  PrettyPrintMinutes(
                      getTravelTime(_distanceValue, _speed1Value))),
            ),
            Text(
              'Nopeus 2: $_speed2Value km/h',
              style: Theme.of(context).textTheme.headline4,
            ),
            Slider(
              onChanged: (double value) {
                setState(() {
                  _speed2Value = value;
                });
              },
              min: 50,
              max: 120,
              divisions: 7,
              label: "Nopeus 2 (km/h)",
              value: _speed2Value,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25.0),
              child: Text('Kulutus nopeudella $_speed2Value km/h = ' +
                  getMileage(_selectedCar, _speed2Value).toStringAsFixed(1) +
                  " l / 100 km, yht. " +
                  (getMileage(_selectedCar, _speed2Value) *
                          _distanceValue /
                          100)
                      .toStringAsFixed(1) +
                  " litraa, matka-aika " +
                  PrettyPrintMinutes(
                      getTravelTime(_distanceValue, _speed2Value))),
            ),
            Text(
                'Aikasäästö suuremmalla nopeudella: ' +
                    PrettyPrintMinutes(
                        (getTravelTime(_distanceValue, _speed1Value) -
                                getTravelTime(_distanceValue, _speed2Value))
                            .abs()),
                style: Theme.of(context)
                    .textTheme
                    .headline5 // .merge(makeBold?) but I can't figure this out ATM
                ),
            Text(
                'Polttoainesäästö pienemmällä nopeudella: ' +
                    ((getMileage(_selectedCar, _speed1Value) -
                                    getMileage(_selectedCar, _speed2Value))
                                .abs() *
                            _distanceValue /
                            100)
                        .toStringAsFixed(1) +
                    " litraa",
                style:
                    Theme.of(context).textTheme.headline5 // .merge(makeBold?)
                ),
          ],
        ),
      ),
    );
  }
}
