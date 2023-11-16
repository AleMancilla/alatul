import 'package:atalup_app/data/my_backend.dart';
import 'package:atalup_app/domain/post.dart';
import 'package:atalup_app/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  MyBackend myBackend = MyBackend();
  Rx<List<Post>> informationService = Rx<List<Post>>([]);
  Rx<List<Post>> filterinformationService = Rx<List<Post>>([]);
  Rx<List<User>> userService = Rx<List<User>>([]);
  TextEditingController buscadorController = TextEditingController();

  @override
  void onInit() {
    chargeData();
    super.onInit();
  }

  chargeData() async {
    try {
      informationService.value = await myBackend.getAllPost();
      userService.value = await myBackend.getAllUser();
      filterinformationService.value = informationService.value;
      print('Information: $informationService');
      print('Users: $userService');
    } catch (e) {
      print('Error: $e');
    }
  }

  filterItems() {
    // informationService.value = [];
    filterinformationService.value = informationService.value
        .where((item) => '${item.title}'
            .toLowerCase()
            .contains(buscadorController.text.toLowerCase()))
        .toList();
  }

  List<TextSpan> highlightOccurrences(String query, String text) {
    List<TextSpan> spans = [];
    final pattern = RegExp(query, caseSensitive: false);
    final matches = pattern.allMatches(text);

    int previousMatchEnd = 0;

    for (Match match in matches) {
      spans.add(TextSpan(
        text: text.substring(previousMatchEnd, match.start),
      ));
      spans.add(TextSpan(
        text: text.substring(match.start, match.end),
        style: TextStyle(
          color: Colors.green[600],
          fontWeight: FontWeight.bold,
        ),
      ));
      previousMatchEnd = match.end;
    }

    spans.add(TextSpan(
      text: text.substring(previousMatchEnd),
    ));

    return spans;
  }
}
