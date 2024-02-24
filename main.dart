import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Page Navigation')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('HomePage'),
            SizedBox(height:30),
        ElevatedButton(
            child: Text('Go to -> Route Pink'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoutePink()),
              );
            })
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////
class RoutePink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Route Pink')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('RoutePink on top now'),   
            SizedBox(height:30),
        ElevatedButton(
            child: Text('Go to -> Route Green'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RouteGreen()),
              );
            }),
            SizedBox(height:30),
        ElevatedButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREEN
///////////////////////////////////////////////
class RouteGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Route Green')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('RouteGreen on top now'),
            SizedBox(height:30),
        ElevatedButton(
            child: Text('Go to -> Route Grey'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RouteGrey()),
              );
            }),
            SizedBox(height:30),
        ElevatedButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREY
///////////////////////////////////////////////
class RouteGrey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('RouteGrey on top now'),
            SizedBox(height:30),
        ElevatedButton(
            child: Text('Go to Homepage'),
            onPressed: () {
              Navigator.popUntil(context,(route)=>route.isFirst);
            }),
      ])),
    );
  }
}
