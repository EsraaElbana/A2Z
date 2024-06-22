import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/local_network.dart';
import '../auth_cubit_Engineer/auth_state.dart';
import 'auth_state.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class AuthCubitClient extends Cubit<AuthStates> {
  AuthCubitClient() : super(AuthInitialStates());

// Todo: API URL => https://student.valuxapps.com/api/
  // Todo: Register endpoint => register



  Future<void>  registerClient({required String email,required String name,
    required String Repass,required String password}) async {
    emit(RegisterLoadingStateClient());
    try{
      Response response = await http.post(
        Uri.parse('https://a2z-render.onrender.com/user/'),
        body: {
          'userName' : name,
          'email' : email,
          'password' : password,
          'Repass' : Repass,

        },
      );
      if( response.statusCode >= 200||response.statusCode<300 )
      {
        var data = jsonDecode(response.body);
        if( data['message'] == "Done" )
        {
          debugPrint("Response is : $data");
          emit(RegisterSuccessStateClient());
        }
        else
        {
          debugPrint("Response is : $data");
          emit(FailedToRegisterStateClient(message: data['message']));
        }
      }
    }
    catch(e){
      debugPrint("Failed to Register , reason : $e");
      emit(FailedToRegisterStateClient(message: e.toString()));
    }
  }

  // Account : mo.ha@gmail.com , password : 123456
  void loginClient({required String email,required String password}) async {
    emit(LoginLoadingState());
    try{
      Response response = await http.post(
        // request => url = base url + method url
        Uri.parse('https://a2z-render.onrender.com/user/login'),
        body: {
          'email' : email,
          'password' : password
        },
      );
      if( response.statusCode == 200 )
      {
        var responseData = jsonDecode(response.body);
        if( responseData['messge'] == "Login done" )
        {
          // debugPrint("User login success and his Data is : ${responseData['data']['token']}");
          // await CacheNetwork.insertToCache(key: "token", value: responseData['data']['token']);
          // await CacheNetwork.insertToCache(key: "password", value: password);
          // userToken = await CacheNetwork.getCacheData(key: "token");
          // currentPassword = await CacheNetwork.getCacheData(key: "password");
          emit(LoginSuccessState());
        }
        else
        {
          debugPrint("Failed to login, reason is : ${responseData['message']}");
          emit(FailedToLoginState(message: responseData['message']));
        }
      }
    }
    catch(e){
      emit(FailedToLoginState(message: e.toString()));
    }
  }
}

