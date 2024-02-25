import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      HomePage.routeName: (context) => HomePage(),
      RoutePink.routeName: (context) => RoutePink(),
      RouteGreen.routeName: (context) => RouteGreen(),
      RouteGrey.routeName: (context) => RouteGrey(),
    });
  }
}

class HomePage extends StatelessWidget {
  static String routeName = '/';
  final Human human_1 = Human(name: 'Andrew', age: 35);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Page Navigation')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('HomePage'),
        SizedBox(height: 30),
        ElevatedButton(
            child: Text('Go to -> Route Pink'),
            onPressed: () {
              Navigator.pushNamed(context, RoutePink.routeName,
                  arguments: human_1);
            })
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////
class RoutePink extends StatelessWidget {
  static String routeName = '/routePink';

  @override
  Widget build(BuildContext context) {
    Human human = ModalRoute.of(context)?.settings.arguments as Human;

    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Route Pink')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('RoutePink on top now'),
        SizedBox(height: 30),
            Text('Username: ${human.name}, Age: ${human.age}'),
            SizedBox(height: 30),
        ElevatedButton(
            child: Text('Go to -> Route Green'),
            onPressed: () {
              Navigator.pushNamed(context, RouteGreen.routeName,
                  arguments: {'strNew': 'Message'});
            }),
        SizedBox(height: 30),
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
  static String routeName = '/routeGreen';
  final String? strNew;
  RouteGreen({this.strNew});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Route Green')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('RouteGreen on top now'),
        Text('Message from Pink page: $strNew'),
        SizedBox(height: 30),
        ElevatedButton(
            child: Text('Go to -> Route Grey'),
            onPressed: () {
              Navigator.pushNamed(context, RouteGrey.routeName);
            }),
        SizedBox(height: 30),
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
  static String routeName = '/routeGrey';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('RouteGrey on top now'),
        SizedBox(height: 30),
        ElevatedButton(
            child: Text('Go to Homepage'),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            }),
      ])),
    );
  }
}

class Human {
  String? name;
  int? age;

  Human({this.name, this.age});
}
