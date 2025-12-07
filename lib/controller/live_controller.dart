import 'package:get/get.dart';

class LiveController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final tabs = ['All', 'Indoor', 'Outdoor', 'Rooms', 'Offline'];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
