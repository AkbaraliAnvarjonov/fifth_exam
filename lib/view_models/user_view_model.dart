import 'package:fifth_exam/data/model/my_response.dart';
import 'package:fifth_exam/data/model/user_model/users_model.dart';
import 'package:fifth_exam/data/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  late UserRepository _userRepository;
  List<UserModel> userList = [];
  String errorForUI = "";

  UserViewModel({required UserRepository userRepository}) {
    _userRepository = userRepository;
    fetchTransactionsList();
  }

  fetchTransactionsList() async {
    MyResponse response = await _userRepository.getUser();
    if (response.error.isEmpty) {
      userList = response.data as List<UserModel>
      
      
      ;
    } else {
      errorForUI = response.error;
    }
    notifyListeners();
  }
}
