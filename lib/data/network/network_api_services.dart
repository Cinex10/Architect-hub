import 'dart:io';

import 'package:architect_hub/data/app_exceptions.dart';
import 'package:architect_hub/data/network/base_api_services.dart';
import 'package:dio/dio.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await Dio().get(url).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await Dio()
          .post(
            url,
            data: data,
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;

      case 400:
        throw BadRequestException(response.data.toString());

      case 404:
        throw UnauthorizedException(response.data.toString());

      default:
        throw FetchDataException(
            'Error Occured While Communicating With Server With StatusCode ${response.statusCode}');
    }
  }
}
