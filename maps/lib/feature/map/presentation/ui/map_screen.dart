import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late CameraPosition initialCameraPosition;
  GoogleMapController? googleMapController;
   LatLng? _currentPosition;

  @override
  void initState() {
    _checkUserPermission();
    initialCameraPosition = CameraPosition(
      target:_currentPosition?? LatLng(30.106989262097898, 31.27998181121152),
      zoom: 12,
    );
    _loadJsonStyle();
    super.initState();
  }

  Set<Marker> markersSet={};
  String? mapStyle;

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onTap: (pos){

            },
            myLocationEnabled: true,
            style: mapStyle,
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (controller) async{
              googleMapController = controller;
              markersSet.addAll(
                {
                  Marker(markerId:MarkerId("marker 1"),
                      position: LatLng(30.106989262097898, 31.27998181121152),
                      icon: await _loadCustomIcon(),
                    infoWindow: InfoWindow(title: "Marker 1",
                    snippet: "marker discreption",
                      onTap: (){
                      showModalBottomSheet(context: context, builder: (context)=>Column(children: [
                        Text("data"),
                        Row()
                      ],));
                      }
                    )
                  ),
                  Marker(markerId:MarkerId("marker 2"),
                      position: LatLng(30.045837495436192, 31.21329131981921),
                      icon: await _loadCustomIcon()
                  ),
                },
              );

              setState(() {

              });

            },
            cameraTargetBounds: CameraTargetBounds(
              LatLngBounds(
                southwest: LatLng(22.878820809793627, 25.094075039057422),
                northeast: LatLng(31.09185692162761, 32.652668492677066),
              ),
            ),

            markers: markersSet
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                googleMapController?.animateCamera(
                  CameraUpdate.newCameraPosition(
                   CameraPosition(
                     target:_currentPosition!,
                     zoom: 12,
                   )
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                margin: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Change Position"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _loadJsonStyle() async {
    final style = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/map_style.json");
    mapStyle = style;
    setState(() {});
  }

  _checkUserPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isDenied) {
      showDialog(context: context, builder: (context)=>AlertDialog(
        content: Text("Please "),
      ));
    } else if (status.isGranted) {
      _getCurrentLocation();

    }
  }

  _getCurrentLocation() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );
    setState(() {
      _currentPosition = LatLng(
        currentPosition.latitude,
        currentPosition.longitude,
      );
      // _startTracking();
      debugPrint("current pos:${_currentPosition?.latitude.toString()}");
    });
  }

  _startTracking(){
    Geolocator.getPositionStream().listen((pos){
      setState(() {
        _currentPosition=LatLng(pos.latitude, pos.longitude);
      });
      googleMapController?.animateCamera(
        CameraUpdate.newLatLng(
            _currentPosition!
        ),
      );
    });
  }

_loadCustomIcon()async{
    return await BitmapDescriptor.asset(ImageConfiguration(
      size: Size(50, 50)), "assets/marker.png");
  }
}
