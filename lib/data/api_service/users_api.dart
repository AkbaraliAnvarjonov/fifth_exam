import 'package:dio/dio.dart';
import 'package:fifth_exam/data/api_service/api_client.dart';
import 'package:fifth_exam/data/model/my_response.dart';
import 'package:fifth_exam/data/model/user_model/users_model.dart';

class UserApiSerice extends ApiClient {
  Future<MyResponse> getUserList() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/users");

      if (response.statusCode == 200) {
        myResponse.data =
           (response.data as List).map((e) => UserModel.fromJson(e)).toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}