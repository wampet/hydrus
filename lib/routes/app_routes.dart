import 'package:hydrus/presentation/about_you_screen/about_you_screen.dart';
import 'package:hydrus/presentation/about_you_screen/bindings/about_you_binding.dart';
import 'package:hydrus/presentation/add_money_bank_screen/add_money_bank_screen.dart';

import 'package:hydrus/presentation/add_money_bank_screen/binding/add_money_bank_binding.dart';
import 'package:hydrus/presentation/add_money_mobile_money_screen/add_money_mobile_money_screen.dart';
import 'package:hydrus/presentation/add_money_mobile_money_screen/binding/add_money_mobile_money_binding.dart';
import 'package:hydrus/presentation/login_screen/binding/login_binding.dart';
import 'package:hydrus/presentation/login_screen/login_view.dart';
import 'package:hydrus/presentation/auth/password_screen/binding/password_screen_binding.dart';
import 'package:hydrus/presentation/auth/views/password_view.dart';

import 'package:hydrus/presentation/company_details_screen/binding/company_details_binding.dart';
import 'package:hydrus/presentation/company_details_screen/company_details_screen.dart';
import 'package:hydrus/presentation/get_started_screen/binding/get_started_screen_binding.dart';
import 'package:hydrus/presentation/get_started_screen/get_started_screen.dart';
import 'package:get/get.dart';
import 'package:hydrus/presentation/home_screen/binding/home_binding.dart';
import 'package:hydrus/presentation/home_screen/home_screen.dart';
import 'package:hydrus/presentation/manage_people_screen/manage_people_screen.dart';
import 'package:hydrus/presentation/open_an_account_screen/binding/open_an_account_binding.dart';
import 'package:hydrus/presentation/open_an_account_screen/open_an_account_screen.dart';
import 'package:hydrus/presentation/setup_company_screen/binding/setup_company_binding.dart';
import 'package:hydrus/presentation/setup_company_screen/set_up_company_screen.dart';
import 'package:hydrus/presentation/splash_screen/binding/splash_screen_binding.dart';
import 'package:hydrus/presentation/splash_screen/splash_screen.dart';
import 'package:hydrus/presentation/transactions_screen/binding/transactions_binding.dart';
import 'package:hydrus/presentation/transactions_screen/transactions_screen.dart';
import 'package:hydrus/presentation/verify_email_screen/binding/verify_email_screen_binding.dart';
import 'package:hydrus/presentation/verify_email_screen/verify_email_screen.dart';

class AppRoutes {
  static String initialRoute = '/initialRoute';
  static String splashScreen = '/splash_screen';

  static String getStartedScreen = '/get_started_screen';

  static String openAnAccountScreen = '/open_an_account_screen';

  static String setupCompanyScreen = '/setup_company_screen';

  static String verifyAccountScreen = '/verify_account_screen';
  static String verifyEmailScreen = '/verify_email_screen';

  static String loginScreen = '/login_screen';
  static String aboutYouScreen = '/about_you_screen';
  static String homeScreen = '/home_screen';
  static String sendMobileMoneyScreen = '/send_mobile_money_screen';
  static String sendAirtimeScreen = '/send_airtime_screen';
  static String sendInternetScreen = '/send_internet_screen';
  static String sendBankScreen = '/send_bank_screen';
  static String sendInternetRecipientScreen = '/send_internet_recipient_screen';
  static String sendAirtimeRecipientScreen = '/send_airtime_recipient_screen';
  static String sendBankRecipientScreen = '/send_bank_recipient_screen';
  static String sendMobileMoneyRecipientScreen =
      '/send_mobile_money_recipient_screen';
  static String payPeopleOptionsScreen = '/pay_people_options_screen';
  static String payPeopleBanksScreen = '/pay_People_banks_screen';
  static String payPeopleBankTransferScreen =
      '/pay_People_bank_transfer_screen';
  static String payPeopleMobileMoneyScreen = '/pay_people_mobile_money_screen';

  static String payPeopleMobileMoneyTwoScreen =
      '/pay_people_mobile_money_two_screen';
  static String payPeopleMobileMoneySendScreen =
      '/pay_people_mobile_money_send_screen';
  static String addMoneyBankScreen = '/add_money_bank_screen';
  static String payPeopleInternetScreen = '/pay_People_internet_screen';
  static String addMoneyMobileMoneyScreen = '/add_money_mobile_money_screen';
  static String transactionsScreen = '/transactions_screen';
  static String managePeopleScreen = '/manage_people_screen';
  static String companyDetailsScreen = '/company_details_screen';
  static String selectAccountScreen = '/select_account_screen';
  static String passwordScreen = '/password_screen';

  ////This is where I am at right now

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashScreenBinding(),
      ],
    ),
    GetPage(
      name: getStartedScreen,
      page: () => GetStartedScreen(),
      bindings: [
        GetStartedScreenBinding(),
      ],
    ),
    GetPage(
      name: openAnAccountScreen,
      page: () => OpenAnAccountScreen(),
      bindings: [
        OpenAnAccountBinding(),
      ],
    ),
    GetPage(
      name: setupCompanyScreen,
      page: () => SetupCompanyScreen(),
      bindings: [
        SetupCompanyBinding(),
      ],
    ),
    // GetPage(
    //   name: verifyAccountScreen,
    //   page: () => VerifyAccountScreen(),
    //   bindings: [
    //     VerifyAccountBinding(),
    //   ],
    // ),
    GetPage(
      name: verifyEmailScreen,
      page: () => VerifyEmailScreen(),
      bindings: [
        VerifyEmailBinding(),
      ],
    ),
    GetPage(
      name: passwordScreen,
      page: () => PasswordScreen(),
      bindings: [
        PasswordScreenBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginPage(),
      bindings: [
        LoginScreenBinding(),
      ],
    ),
    GetPage(
      name: aboutYouScreen,
      page: () => AboutYouScreen(),
      bindings: [
        AboutYouScreenBinding(),
      ],
    ),
    GetPage(
      name: companyDetailsScreen,
      page: () => CompanyDetailsScreen(),
      bindings: [
        CompanyDetailsScreenBinding(),
      ],
    ),

    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),



    GetPage(
      name: addMoneyBankScreen,
      page: () => AddMoneyBankScreen(),
      bindings: [
        AddMoneyBankBinding(),
      ],
    ),

    GetPage(
      name: addMoneyMobileMoneyScreen,
      page: () => AddMoneyMobileMoneyScreen(),
      bindings: [
        AddMoneyMobileMoneyBinding(),
      ],
    ),
    GetPage(
      name: transactionsScreen,
      page: () => TransactionsScreen(),
      bindings: [
        TransactionsBinding(),
      ],
    ),

    GetPage(
      name: managePeopleScreen,
      page: () => ManagePeopleScreen(),
      // bindings: [],
    ),
  ];
}
