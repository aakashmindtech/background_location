  import 'package:awesome_notifications/awesome_notifications.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:geolocator/geolocator.dart';
  import 'package:location/NotificationService.dart';
import 'package:location/second_route.dart';
  import 'package:permission_handler/permission_handler.dart';

  void main() {
    const MethodChannel channel = MethodChannel('com.example.location_service');

    runApp(const MaterialApp(
      home: MyHomePage(
        title: '',
      ),
    ));
  }

  class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key, required this.title});

    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {
    static const platform = MethodChannel('com.example.location_service');

    NotificationService notificationService = NotificationService();

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

    Future<void> startLocationService() async {
      try {
        await platform.invokeMethod('startLocationUpdates');
      } on PlatformException catch (e) {
        print("Error: $e");
      }
    }

    Future<void> stopLocationService() async {
      try {
        await platform.invokeMethod('stopLocationService');
      } on PlatformException catch (e) {
        print("Failed to stop location service: ${e.message}");
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                  );
                },
                child: const Icon(Icons.more_vert))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '',
              ),
              Text(
                '',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            startLocationService();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  }
