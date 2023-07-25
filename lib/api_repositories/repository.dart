import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:surf_practice_magic_ball/api_repositories/data_models/ball_response_model.dart';
import 'package:surf_practice_magic_ball/consts/strings.dart';

Future<BallResponseModel> getResponseBall() async {

  Map<String, String> headers = <String, String>{};
  headers['Content-Type'] = 'application/json';
  headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Origin, Accept';

  Uri url = Uri.parse(Strings.baseUrl);
  Response response;
  try {
    response = await http.post(url, headers: headers);
  } on Exception catch (e) {
    return BallResponseModel(error: Strings.unknownError);
  } catch (e) {
    return BallResponseModel(error: Strings.unknownError);
  }
  if (200 <= response.statusCode && response.statusCode < 309) {

    final getResponse = await http.get(Uri.parse(response.headers["location"]!), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });

    return ballResponseModelFromJson(getResponse.body);
  }
  return BallResponseModel(error: Strings.unknownError);
}