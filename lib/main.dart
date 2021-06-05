import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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

class _MyHomePageState extends State<MyHomePage> {
  double _distanceValue = 10;
  double _speed1Value = 50;
  double _speed2Value = 80;
  CarType? _selectedCar = CarType.A;

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              'Matka (km):',
            ),
            Text(
              '$_distanceValue',
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
              'Nopeus 1 (km/h):',
            ),
            Text(
              '$_speed1Value',
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
            Text(
              'Nopeus 2 (km/h):',
            ),
            Text(
              '$_speed2Value',
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
            )
          ],
        ),
      ),
    );
  }
}
