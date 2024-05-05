import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

/// simulator -> Features -> location -> Custom ~
class _DeliveryState extends State<Delivery> {
  final CameraPosition initialPosition = CameraPosition(
    target: LatLng(
      ///Lat: 위도, Lng: 경도
      37.282470,
      127.900079,
    ),
    zoom: 15,
  );

  bool deliveryDone = false;
  final double okDistance = 100;

  @override
  initState() {
    super.initState();

    // checkPermission();
    Geolocator.getPositionStream().listen((event) {
      final start = LatLng(
        37.282470,
        127.900079,
      );
      final end = LatLng(
        event.latitude,
        event.longitude,
      );

      final distance = Geolocator.distanceBetween(
        start.latitude,
        start.longitude,
        end.latitude,
        end.longitude,
      );
    });
  }

  checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      throw Exception('위치 기능을 활성화 해주세요.');
    }

    /// 현재 앱 권한 확인(확인 하려면 앱 삭제 해야 함)
    LocationPermission checkedPermission = await Geolocator.checkPermission();

    // if (checkedPermission == LocationPermission.denied) {
    //   checkedPermission = await Geolocator.requestPermission();
    // }

    // if (checkedPermission != LocationPermission.always &&
    //     checkedPermission != LocationPermission.whileInUse) {
    //   throw Exception('위치 권한을 허가 해주세요.');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'quickxi',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder(
        future: checkPermission(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return Column(
            children: [
              Expanded(
                flex: 2,

                /// 2 : 1 비율
                child: GoogleMap(
                  initialCameraPosition: initialPosition,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  markers: {
                    Marker(
                      markerId: MarkerId('123'),
                      position: LatLng(
                        37.282470,
                        127.900079,
                      ),
                    ),
                  },
                  circles: {
                    Circle(
                      circleId: CircleId('inDistance'),
                      center: LatLng(
                        37.282470,
                        127.900079,
                      ),
                      radius: okDistance,
                      fillColor: Colors.blue.withOpacity(0.5),
                      strokeColor: Colors.blue,
                      strokeWidth: 1,
                    ),
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      deliveryDone ? Icons.check : Icons.timelapse_outlined,
                      color: deliveryDone ? Colors.green : Colors.blue,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    // if (deliveryDone == false && canDelibery)
                      if (deliveryDone == false)
                        OutlinedButton(
                        onPressed: deliveryPressed,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        child: Text(
                          '배송',
                        ),
                      ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  deliveryPressed() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('배송하기'),
          content: Text('배송을 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              child: Text('배송 시작'),
            ),
          ],
        );
      },
    );

    if (result == true) {
      setState(() {
        deliveryDone = true;
      });
    }
  }
}
