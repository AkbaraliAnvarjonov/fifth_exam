import 'package:fifth_exam/data/services/api/users_api.dart';
import 'package:fifth_exam/data/model/my_response.dart';

class UserRepository {
  UserApiSerice apiSerice;
  UserRepository({required this.apiSerice});

  Future<MyResponse> getUser() => apiSerice.getUserList();
}