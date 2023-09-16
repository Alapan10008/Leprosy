import 'package:get/get.dart';
import 'package:varun_s_application1/presentation/frame_screen/binding/frame_binding.dart';
import 'package:varun_s_application1/presentation/frame_screen/frame_screen.dart';

class AppRoutes {
  static const String frameScreen = '/frame_screen';
  static const String homeScreen = '/home_screen';

  static const String b2bDetailsScreen = '/AshaDetail';

  static const String doctorsThreeScreen = '/doctors_three_screen';

  static const String patientDetailsScreen = '/patient_details_screen';

  static const String patientsScreen = '/patients_screen';

  static const String scannerThirteenScreen = '/scanner_thirteen_screen';

  static const String scannerTwoScreen = '/scanner_two_screen';

  static const String signupTwoScreen = '/signup_two_screen';

  static const String signinScreen = '/signin_screen';

  static const String forgotpasswordScreen = '/forgotpassword_screen';

  static const String recoverycodeScreen = '/recoverycode_screen';

  static const String newpasswordScreen = '/newpassword_screen';

  static const String passwordresetsuccessfulScreen =
      '/passwordresetsuccessful_screen';

  static const String welcomebackScreen = '/welcomeback_screen';

  static const String splashscreenScreen = '/splashscreen_screen';

  static const String scannerThreeScreen = '/scanner_three_screen';

  static const String scannerSixScreen = '/scanner_six_screen';

  static const String scannerElevenScreen = '/scanner_eleven_screen';

  static const String doctorsTwoScreen = '/doctors_two_screen';

  static const String healhLedgerTwoScreen = '/healh_ledger_two_screen';

  static const String signupScreen = '/signup_screen';

  static const String patientDetailsFourScreen = '/patient_details_four_screen';

  static const String patientDetailsFiveScreen = '/patient_details_five_screen';

  static const String healhLedgerScreen = '/healh_ledger_screen';

  static const String doctorsFourScreen = '/doctors_four_screen';

  static const String patientDetailsOneScreen = '/patient_details_one_screen';

  static const String stepOneScreen = '/step_one_screen';

  static const String stepTwoScreen = '/step_two_screen';

  static const String stepThreeScreen = '/step_three_screen';

  static const String stepFourScreen = '/step_four_screen';

  static const String animatedNailOneScreen = '/animated_nail_one_screen';

  static const String healhLedgerFiveScreen = '/healh_ledger_five_screen';

  static const String signupThreeScreen = '/signup_three_screen';

  static const String patientDetailsNineScreen = '/patient_details_nine_screen';

  static const String doctorsSixScreen = '/doctors_six_screen';

  static const String patientDetailsSevenScreen =
      '/patient_details_seven_screen';

  static const String scannerTwentyScreen = '/scanner_twenty_screen';

  static const String scannerEighteenScreen = '/scanner_eighteen_screen';

  static const String scannerSixteenScreen = '/scanner_sixteen_screen';

  static const String doctorsEightScreen = '/doctors_eight_screen';

  static const String doctorsFiveScreen = '/doctors_five_screen';

  static const String patientDetailsSixScreen = '/patient_details_six_screen';

  static const String scannerFifteenScreen = '/scanner_fifteen_screen';

  static const String scannerFourteenScreen = '/scanner_fourteen_screen';

  static const String scannerSeventeenScreen = '/scanner_seventeen_screen';

  static const String healhLedgerFourScreen = '/healh_ledger_four_screen';

  static const String doctorsSevenScreen = '/doctors_seven_screen';

  static const String patientDetailsEightScreen =
      '/patient_details_eight_screen';

  static const String popupScreen = '/popup_screen';

  static const String doctorsTenScreen = '/doctors_ten_screen';

  static const String doctorsNineScreen = '/doctors_nine_screen';

  static const String doctorsElevenScreen = '/doctors_eleven_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static String selectKitScreen = '/select_kit_screen';

  static List<GetPage> pages = [
    GetPage(
      name: frameScreen,
      page: () => FrameScreen(),
      bindings: [
        FrameBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => FrameScreen(),
      bindings: [
        FrameBinding(),
      ],
    ),
  ];
}
