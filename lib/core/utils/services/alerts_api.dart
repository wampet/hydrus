import 'package:authentication_repository/authentication_repository.dart';
import 'package:hydrus/core/services/rest_api/rest_api_services.dart';
import 'package:hydrus/models/response_model.dart';

class AlertsApi extends RestApiServices {
  static String errMessage = RestApiServices.errMessage;

  AlertsApi();

  AlertsApi.withAuthRepository(
      AuthenticationRepository authenticationRepository)
      : super.withAuthRepository(authenticationRepository);

  Future<ResponseModel> getAlerts() async {
    return await makePost(
      url: "get-alerts",
    );
  }
}
