import 'package:firefighters_app/screens/widgets/round_icon_button.dart';
import 'package:firefighters_app/utilities/resources/ffa_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  static const String id = 'location';

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController mapController;
  late final Location _location = Location();
  final Map<String, Marker> _markers = {};
  late bool isPressed = false;
  late bool isTrackingEnabled = false;

  Future<void> _onMapCreated(GoogleMapController _controller) async {
    mapController = _controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        compassEnabled: true,
        initialCameraPosition: CameraPosition(
          target: const LatLng(0, 0),
          zoom: 2,
        ),
        markers: _markers.values.toSet(),
        onTap: _addMarker,
      ),
      Positioned(
        bottom: 130,
        right: 22,
        child: RoundIconButton(
          onPress: _handlePress,
          fillColor: isPressed ? FFAColor.mainRedColor : FFAColor.mainIdleColor,
          child: Icon(Icons.fireplace_rounded),
        ),
      ),
      Positioned(
        bottom: 60,
        right: 22,
        child: RoundIconButton(
          onPress: _trackYourLocation,
          fillColor: FFAColor.mainRedColor,
          child: Icon(Icons.gps_fixed_rounded),
        ),
      ),
    ]);
  }

  void _handlePress() => setState(() {
        if (isPressed) {
          isPressed = false;
        } else {
          isPressed = true;
        }
      });

  void _addMarker(LatLng position) => setState(() {
        if (isPressed) {
          var dateTime = DateTime.now().toString();
          setState(() {
            _markers.clear();
            var marker = Marker(
              markerId: MarkerId(dateTime),
              position: position,
              draggable: true,
              icon: BitmapDescriptor.defaultMarker,
            );
            _markers[dateTime] = marker;
          });
        }
      });

  void _trackYourLocation() => setState(() async {
        var pos = await _location.getLocation();
        await mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(pos.latitude!, pos.longitude!), zoom: 15),
          ),
        );
      });
}
