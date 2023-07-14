import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {super.key,
      this.location = const PlaceLocation(
        latitude: 37.422,
        longitude: -122.084,
        address: '',
      )});

  final PlaceLocation location;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
          zoom: 16,
          onTap: (tapPosition, point) {
            setState(() {
              _selectedLocation = point;
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/aswinsubhash3/clk0zx3wv00ae01pf9xlj4rt0/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYXN3aW5zdWJoYXNoMyIsImEiOiJjbGswenAzNXgwMXp4M3JwdW5vcGd2OWNhIn0.W6EzxW9x2fIG9i1KoCT9tg',
            additionalOptions: const {
              'accessToken':
                  'pk.eyJ1IjoiYXN3aW5zdWJoYXNoMyIsImEiOiJjbGswenAzNXgwMXp4M3JwdW5vcGd2OWNhIn0.W6EzxW9x2fIG9i1KoCT9tg',
              'id': 'mapbox.mapbox-streets-v8'
            },
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 40,
                height: 40,
                point: _selectedLocation ??
                    LatLng(widget.location.latitude, widget.location.longitude),
                builder: (context) => const SizedBox(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
