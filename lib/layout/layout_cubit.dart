import 'dart:convert';
//import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../model/Engineer_model.dart';
import '../shared/constants/constants.dart';
import 'layout_state.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import 'dart:io';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  File? profileImage;

  Future <void>pickerGallery() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);


    profileImage = File(myfile!.path);

    emit(state);

  }
  File? image;
  Future<void> getImageFromGalleryProfilePic() async {
    final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pic != null) {
      image = File(pic.path);
    }

    emit(state);
  }

  EngModel? engModel;

  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    http.Response response = await http.get(
        Uri.parse("https://a2z-render.onrender.com/engineer/getUser"),
        headers: {
          'Authorization': "Saraha $userToken",
        });
    var responseData = jsonDecode(response.body);
    // print(response.body);
    print(response.statusCode);
    if (responseData['message'] == "done") {
      engModel = EngModel.fromJson(json: responseData['user']);
      // print("response is : $responseData");
      emit(GetUserDataSuccessState());
    } else {
      // print("response is : $responseData");
      emit(FailedToGetUserDataState(error: responseData['message']));
    }
  }

// filtered products

 Future<void>  postPictureProfile(File image) async {
    var headers = {
      'Authorization': "Saraha $userToken",
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://a2z-render.onrender.com/engineer/Profile'));
    request.files.add(
      await
          http.MultipartFile.fromBytes('image', image.readAsBytesSync(),
              filename: image.path.split("/").last,
          contentType: MediaType("image", "jpeg")),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    var responseBody = jsonDecode(await response.stream.bytesToString());
    if (responseBody['messege'] == "Done") {
      print(responseBody);
      emit(profilePicSuccessState());
    } else {
      print(responseBody);

      emit(profilePicFailedState(errorf: responseBody['message']));
    }
 }

    }

// void updateUserData({required String name,
//   required String phone,
//   required String email}) async {
//   emit(UpdateUserDataLoadingState());
//   try {
//      http.Response response = await http.put(
//         Uri.parse("https://student.valuxapps.com/api/update-profile"),
//         headers: {'lang': 'en', 'Authorization': userToken!},
//         body: {'name': name, 'email': email, 'phone': phone});
//     var responseBody = jsonDecode(response.body);
//     if (responseBody['status'] == true) {
//       await getUserData();
//       emit(UpdateUserDataSuccessState());
//     } else {
//       emit(UpdateUserDataWithFailureState(responseBody['message']));
//     }
//   } catch (e) {
//     emit(UpdateUserDataWithFailureState(e.toString()));
//   }
// }
