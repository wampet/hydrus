import 'package:authentication_repository/authentication_repository.dart';
import 'package:hydrus/core/services/rest_api/rest_api_services.dart';
import 'package:hydrus/models/response_model.dart';

class SettingsApi extends RestApiServices {
  static String errMessage = RestApiServices.errMessage;
  SettingsApi();
  SettingsApi.withAuthRepository(
      AuthenticationRepository authenticationRepository)
      : super.withAuthRepository(authenticationRepository);

  Future<ResponseModel> supportedCategories() async {
    return await makeGet(url: "settings/supported-categories");
  }
}
