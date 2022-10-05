part of app_helpers;

Future<User?> onAuthenticated(ResponseModel loginRes,
    AuthenticationRepository authenticationRepository) async {
  try {
    AuthController authController = Get.find();
    var locStorageServ = LocalStorageServices();
    await locStorageServ.saveToken(loginRes.data?['access_token']);
    var bankTrnsferCharge = loginRes.data?['transfer_charge'] ?? 0;
    User _user = await locStorageServ.saveUserFromMap(loginRes.data?['user']);



    // locStorageServ.saveUserStatisticsFromMap(loginRes.data?['statistics']);

    authController.user.value = _user;
    authController.token.value = await locStorageServ.getToken();

    authController.isAuthenticated = true;
    // authController.appBanks.value = appBanks;
    authController.bankTransferCharge.value = bankTrnsferCharge;

    // if (_user.otpVerified != true) {
    //   authenticationRepository.shouldValidateOtp();
    //   return null;
    // }

  //   if ((_user.id is int) && (_user.id! > 0)) {
  //     authenticationRepository.setLoggedIn();
  //   }

  //   // authController.updateUserOnsignalId();

  //   return _user;
  } catch (e) {
    return User();
  }
}
  

