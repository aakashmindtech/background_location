import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class LocationChange extends StatefulWidget {
  const LocationChange({super.key});

  @override
  State<LocationChange> createState() => _LocationChangeState();
}

class _LocationChangeState extends State<LocationChange> {
  static const MethodChannel _methodChannel =
  MethodChannel('location_channel');

  @override
  void initState() {
    super.initState();
    startBackgroundLocationUpdates();
  }

  void startBackgroundLocationUpdates() {
    try {
      _methodChannel.invokeMethod('startBackgroundLocationUpdates');
    } on PlatformException catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}