import 'package:atalup_app/core/utils.dart';
import 'package:atalup_app/injection/get/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Column(
              children: [
                _appBar(),
                _searching(),
              ],
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return itemPost(index);
                  },
                  itemCount: controller.filterinformationService.value.length,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Container _appBar() {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color.fromRGBO(233, 85, 76, 1),
              Color.fromRGBO(233, 62, 95, 1),
            ]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 100,
            height: 100,
          ),
          Text(
            'Alatul',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 40),
          ),
          SizedBox(
            width: 50,
          )
        ],
      ),
    );
  }

  Widget _searching() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown[50],
            borderRadius: BorderRadius.circular(100),
            // border: Border.all(),
          ),
          child: TextField(
            controller: controller.buscadorController,
            onChanged: (value) {
              controller.filterItems();
            },
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Quaerere per titulum...',
                suffixIcon: Icon(Icons.search)),
          ),
        ),
      ),
    );
  }

  Widget itemPost(int index) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            _backPart(),
            _frontPart(index),
          ],
        ),
      ),
    );
  }

  Padding _frontPart(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(
                right: 10,
              ),
              // padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                  color: getColorById(
                      controller.filterinformationService.value[index].userId ??
                          0),
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
                  width: 70,
                  height: 70,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, //
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: controller.highlightOccurrences(
                          controller.buscadorController.text,
                          '${controller.filterinformationService.value[index].title}'),
                    ),
                  ),
                  Text(
                    '${controller.filterinformationService.value[index].body}',
                    maxLines: 2,
                    overflow: TextOverflow
                        .ellipsis, // Opcional: esto añade puntos suspensivos (...) al final si el texto se corta.
                  ),
                ],
              ),
            ),
            // Container(
            //   width: 10,
            //   color: Colors.red,
            //   // height: 10,
            //   margin: EdgeInsets.only(left: 18),
            //   padding: EdgeInsets.all(0),
            // )
          ],
        ),
      ),
    );
  }

  Container _backPart() {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(233, 85, 76, 1),
            Color.fromRGBO(233, 62, 95, 1),
          ],
        ),
        color: Colors.green,
        boxShadow: [
          BoxShadow(
            offset: Offset(-2.5, 2.5),
            blurRadius: 5,
            color: Colors.black26,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Expanded(child: Container()),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
