import 'package:atalup_app/injection/get/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey[900],
      backgroundColor: Colors.white,
      body: Material(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(233, 85, 76, 1),
                Color.fromRGBO(233, 62, 95, 1),
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(child: _centerLogo()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _centerLogo() {
    return Center(
      child: Hero(
        tag: 'log_gamlp',
        transitionOnUserGestures: true,
        // transitionDuration: Duration(seconds: 1), // Cambia la duración de la animación
        child: Image.asset(
          'assets/images/logo.png',
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}
