import 'package:news_app/services/networking_service.dart/data_response.dart';

isApiResponseCompleted(NetworkDataResponse response) {
  return response.status == Status.COMPLETED;
}

isApiResponseError(NetworkDataResponse response) {
  return response.status == Status.ERROR;
}

isApiResponseLoading(NetworkDataResponse response) {
  return response.status == Status.LOADING;
}
