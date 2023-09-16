import 'package:get/get.dart';

import '../controller/share_referral_screen_controller.dart';

class DoctorsThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareReferralScreeController());
  }
}
