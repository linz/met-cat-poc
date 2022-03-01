import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// import 'package:easy_web_view/easy_web_view.dart';

class MapPage extends StatelessWidget {
  const MapPage(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Center(child: Text('Map goes here ;-)'));
    // return EasyWebView(
    //     src: 'https://basemaps.linz.govt.nz', onLoaded: () => print('loaded'));
    return FlutterMap(
      options: MapOptions(
        center: LatLng(-40.9, 174.88),
        zoom: 7.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              "https://basemaps.linz.govt.nz/v1/tiles/aerial/EPSG:3857/{z}/{x}/{y}.webp?api=c01fwdvp8g1aksf33dfq00rjyn1",
          //   urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (_) {
            return const Text("Land Information New Zealand");
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(51.5, -0.09),
              builder: (ctx) => Container(
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
