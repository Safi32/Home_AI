import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:home_ai/controller/registeration_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegistrationController>(RegistrationController(), permanent: true);
  }
}