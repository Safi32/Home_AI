import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:home_ai/controller/login_controller.dart';
import 'package:home_ai/controller/registeration_controller.dart';
import 'package:home_ai/controller/edit_profile_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<RegistrationController>(RegistrationController(), permanent: true);
    Get.put<EditProfileController>(EditProfileController(), permanent: true);
  }
}
