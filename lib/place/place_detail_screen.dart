import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDetailScreen extends StatefulWidget {
  final Map<String, String> place;
  const PlaceDetailScreen({super.key, required this.place});

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    final lat = double.parse(widget.place["lat"]!);
    final lng = double.parse(widget.place["lng"]!);

    return Scaffold(
      backgroundColor: const Color(0xFF6A4FE3),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(widget.place["title"]!,
            style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: ListView(
        children: [
          // BIG IMAGE
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(30)),
            child: Image.network(
              widget.place["image"]!,
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // DETAILS
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.place["details"]!,
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 15, height: 1.6),
            ),
          ),

          // INTERACTIVE GOOGLE MAP
          Container(
            height: 300,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GoogleMap(
                zoomControlsEnabled: true,
                myLocationButtonEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat, lng),
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId("place"),
                    position: LatLng(lat, lng),
                    infoWindow: InfoWindow(title: widget.place["title"]),
                  )
                },
                onMapCreated: (controller) => mapController = controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
