import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _counterList = [];
  int _counter = 1;

  bool _isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  String _getCounterType(int counter) {
    if (_isPrime(counter)) {
      return "nombre premier";
    } else if (counter % 2 == 0) {
      return "pair";
    } else {
      return "impair";
    }
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle = _counterList.isNotEmpty
        ? "${_counterList.last} ${_getCounterType(_counterList.last)}"
        : "Pomme, Poire et Ananas";
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: ListView.builder(
        itemCount: _counterList.length,
        itemBuilder: (BuildContext context, int index) {
          int item = _counterList[index];
          bool isEven = item % 2 == 0;
          String counterType = _getCounterType(item);
          String imagePath;

          if (counterType == "nombre premier") {
            imagePath = 'assets/images/ananas.png';
          } else if (isEven) {
            imagePath = 'assets/images/poire.png';
          } else {
            imagePath = 'assets/images/pomme.png';
          }

          return Container(
            color: isEven ? Colors.cyan : Colors.indigo,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(2.0),
            child: Row(
              children: [
                Image.asset(imagePath, height: 30),
                SizedBox(width: 8),
                Text(
                  '$item',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counterList.add(_counter);
            _counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
