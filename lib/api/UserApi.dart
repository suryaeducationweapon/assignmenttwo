

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:assignmenttwo/api/UsersApiResponse.dart';
import 'package:assignmenttwo/api/PageTwoResponse.dart';

class UsersApi extends ChangeNotifier{

  UsersResponse usersResponse;

  Future<UsersResponse>  PageOneUsersData() async{

    String apiUrl="https://reqres.in/api/users";

    var dio = Dio();
    try {

      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        UsersResponse usersResponse = UsersResponse.fromJson(response.data);
        print("Page 1 response "+response.data.toString());

        return usersResponse;
      }
    }
    catch (e) {
      print(e);
    }

  }

  ///////////// .... Page2 ........
  UsersResponseTwo usersResponseTwo;
Future<UsersResponseTwo>  PageTwoUsersData() async{

  String apiUrl="https://reqres.in/api/users/?page=2";

  var dio = Dio();
  try {

    final response = await dio.get(apiUrl);

    if (response.statusCode == 200) {
      UsersResponseTwo usersResponseTwo = UsersResponseTwo.fromJson(response.data);
      print("Page 2 response "+response.data.toString());

      return usersResponseTwo;
    }
  }
  catch (e) {
    print(e);
  }

}


}