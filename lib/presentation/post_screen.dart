import 'package:atalup_app/core/utils.dart';
import 'package:atalup_app/domain/post.dart';
import 'package:atalup_app/domain/user.dart';
import 'package:atalup_app/injection/get/data_controller.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class PostScreen extends StatelessWidget {
  PostScreen({required this.post});

  Post post;
  final DataController controller = Get.find();
  Rx<User?> user = Rx<User?>(null);

  @override
  Widget build(BuildContext context) {
    user.value = controller.getUser(post.userId ?? 0);
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userInfo(),
            _mapSection(),
            // SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${post.title}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '${post.body}',
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _mapSection() {
    return Container(
      width: double.infinity,
      height: 200,
      child: FlutterMap(
        // mapController: _animatedMapController.mapController,
        options: MapOptions(
          enableScrollWheel: false,
          enableMultiFingerGestureRace: false,
          center: LatLng(double.parse(user.value!.address!.geo!.lat!),
              double.parse(user.value!.address!.geo!.lng!)),
          zoom: 1,

          // initialCenter: _getCoordinatesOfInventario(),
          // initialZoom: _askForCoordinates() ? 16 : 12,
          interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          maxZoom: 18.3,
        ),
        nonRotatedChildren: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            // urlTemplate:'https://a.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}@2x.png',
            // urlTemplate:
            //     'https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
            fallbackUrl: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.alecodeando.gamlp',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(double.parse(user.value!.address!.geo!.lat!),
                    double.parse(user.value!.address!.geo!.lng!)),
                width: 65,
                height: 65,
                anchorPos: AnchorPos.align(AnchorAlign.top),
                builder: (context) =>
                    Image.asset('assets/images/location_pin.png'),
              ),
            ],
          )

          // _myLocationButton(),
          // _listLocationsButton(),
          // _lateralMenu(),
        ],
        children: [],
      ),
    );
  }

  Container _userInfo() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color.fromRGBO(233, 85, 76, 1),
              Color.fromRGBO(233, 62, 95, 1),
            ]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.only(
              right: 10,
            ),
            // padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
                color: getColorById(post.userId ?? 0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(-2.5, 2.5),
                      blurRadius: 5,
                      color: Colors.black26)
                ]),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 170,
                height: 170,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.value?.username}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${user.value?.name}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '${user.value?.email}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '${user.value?.phone}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '${user.value?.website}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('${user.value!.username}'),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color.fromRGBO(233, 85, 76, 1),
                Color.fromRGBO(233, 62, 95, 1),
              ]),
        ),
      ),
    );
  }
}
