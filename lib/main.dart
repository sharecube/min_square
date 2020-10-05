import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int result = 0;

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 64.0, right: 64.0),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  labelText: "Type number and press 'Determine'",
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 64.0, right: 64.0),
            child: OutlineButton(
              child: Text('Determine'),
              onPressed: () {
                getMinSquares(int.parse(this._controller.value.text));
              },
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
          Center(
            child: Text(
              this.result.toString(),
            ),
          ),
        ],
      ),
    );
  }

  int getMinSquares(int n) {
    if (n <= 3) return n;
    int res = n;
    for (int x = 1; x <= n; x++) {
      int temp = x * x;
      if (temp > n)
        break;
      else
        res = math.min(res, 1 + getMinSquares(n - temp));
    }
    setState(() {
      this.result = res;
    });
    return this.result;
  }

}
