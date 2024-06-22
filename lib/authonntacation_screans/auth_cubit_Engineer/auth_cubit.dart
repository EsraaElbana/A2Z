import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';

import 'package:image_picker/image_picker.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/local_network.dart';
import 'auth_state.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart' show MediaType;

class AuthCubit extends Cubit<AuthStates_eng> {
  AuthCubit() : super(AuthInitialsState());

// Todo: API URL => https://student.valuxapps.com/api/
  // Todo: Register endpoint => register

  File? img;

  Future<void> getImageFromGalleryLicencePic() async {
    final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pic != null) {
      img = File(pic.path);
    }

    emit(state);
  }

  // Future uploadToApi() async {
  //   return await MultipartFile.fromFile("image", filename: img!.path);
  // }

  Future<void> postData({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    required String address,
    required File img,
  }) async {
    emit(RegisterLoadingState());
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://a2z-render.onrender.com/engineer/'));
      request.fields.addAll({
        'userName': userName,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'address': address,
      });
      request.files.add(
        await http.MultipartFile.fromBytes('image', img.readAsBytesSync(),
            filename: img.path.split("/").last,
            contentType: MediaType("image", "jpeg")),
      );
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      var responseBody = jsonDecode(await response.stream.bytesToString());
      if (responseBody["message"] == "Done") {
        print(responseBody);
        emit(RegisterSuccessState());
      } else {
        print(responseBody);
        debugPrint("Response is : $responseBody");
        // emit(FailedToRegisterState(message: data['message']));
        emit(RegisterFailedState(message: responseBody['message']));
      }
    } catch (e) {
      print(e);
    }
  }

  void login({required String email, required String password}) async {
    emit(LoginLoadingStateEng());
    try {
      http.Response response = await http.post(
          Uri.parse('https://a2z-render.onrender.com/engineer/login'),
          body: json.encode({'email': email, 'password': password}),
          headers: {
            'email': email,
            'password': password,
            'Content-Type': 'application/json'
          });

      // var headers = {
      //   'email': email,
      //   'password': password,
      //   'Content-Type': 'application/json'
      // };
      // var request = http.Request('POST', Uri.parse('https://a2z-render.onrender.com/engineer/login'));
      // request.body = json.encode({
      //   "email":email,
      //   "password": password
      // });
      // request.headers.addAll(headers);
      // http.StreamedResponse response = await request.send();
      // var responseBody = jsonDecode(await response.stream.bytesToString());
      //print(response.stream.bytesToString());
      print(response.statusCode);
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      //var data = jsonDecode(response.body);
      if (response.statusCode >= 200 || response.statusCode < 300) {
        //var data = jsonDecode(response.body);
        if (responseBody['messge'] == "Login done") {
          print(
              "User login success and his Data is : ${responseBody['engineerUpdated']['token']}");
          await CacheNetwork.insertToCache(
              key: "token", value: responseBody['engineerUpdated']['token']);
          await CacheNetwork.insertToCache(key: "password", value: password);
          userToken = await CacheNetwork.getCacheData(key: "token");
          currentPassword = await CacheNetwork.getCacheData(key: "password");
          emit(LoginSuccessStateEng());
        } else {
          print("Failed to login, reason is : ${responseBody['messge']}");
          emit(FailedToLoginStateEng(message: responseBody['messge']));
        }
      }
    } catch (e) {
      print(e.toString());
      emit(FailedToLoginStateEng(message: e.toString()));
    }
  }

// Future<void> postProfilePicture(File image) async {
//   emit(RegisterLoadingState());
//   try {
//     var request = http.MultipartRequest(
//         'POST', Uri.parse('https://a2z-render.onrender.com/engineer/Profile'));
//         var headers=
//         {
//           'authorization': "Saraha $userToken"
//
//         };
//
//
//     // var headers = {
//     //   'authorization': 'Saraha '
//     // };
//
//     request.files.add(
//       await http.MultipartFile.fromBytes('image',image.readAsBytesSync(),
//           filename: image.path
//               .split("/")
//               .last,
//           contentType: MediaType("image", "jpeg")),
//     );
//
//
//
//     http.StreamedResponse response = await request.send();
//     print(response.statusCode);
//     var responseBody = jsonDecode(await response.stream.bytesToString());
//
//     if (responseBody["message"] == "Done") {
//       print(responseBody);
//       emit(RegisterSuccessState());
//     } else {
//       print(responseBody);
//
//       emit(RegisterFailedState(message: responseBody['message']));
//     }
//   } catch (e) {
//     print(img);
//     print(e);
//   }
// }
//
}
