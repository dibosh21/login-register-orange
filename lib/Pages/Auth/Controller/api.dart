import 'package:interview/Component/Http/http.dart';

class API {
  /* Login */
  static Future<HttpModel> login(context, {Map<String, Object>? body}) async {
    HttpModel _http = await httpCallback(
      context: context,
      subURL: '/api/authaccount/login',
      body: body ??
          {
            'email': 'dibosh@gmail.com',
            'password': '123456',
          },
    );
    return _http;
  }

  /* Register */
  static Future<HttpModel> register(context, {Map<String, Object>? body}) async {
    HttpModel _http = await httpCallback(
      context: context,
      subURL: '/api/authaccount/registration',
      body: body ??
          {
            'fullname': 'A S M Obaidullah Kaiser',
            'email': 'dibosh@gmail.com',
            'phonenumber': '01717045775',
            'password': '123456',
          },
    );
    return _http;
  }
}
