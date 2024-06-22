// class UserModel{
//   String? userName;
//   String? email;
//   String? phone;
//   String? profilePic;
//   String? token;
//   String? password;
//   String?address;
//
//   // Constructor
//   UserModel(this.userName,this.email,this.token,this.phone,this.profilePic,this.password,this.address);
//
//   // Named constructor
//   UserModel.fromJson({required Map<String,dynamic> user}){
//     // Refactoring Map | Json
//     userName = user['name'];
//     email = user['email'];
//     phone = user['phone'];
//     profilePic = user['profilePic']["secure_url"];
//     token = user['token'];
//     password=user["password"];
//     address=user["address"];
//   }
//
//   // To Map
//   Map<String,dynamic> toMap(){
//     return {
//       'name' : userName,
//       'email' : email,
//       'phone' : phone,
//       'token' : token,
//       'image' : profilePic,
//       'password':password,
//       'address':address
//     };
//   }
//
// }

class EngModel {
  String? userName;
  String? email;
  String? password;
  String? phoneNumber;
  List? address;
  String? token;
  ProfilePic? profilePic;
  String?_id;

  EngModel(
    this.userName,
    this.email,
    this.password,
    this.phoneNumber,
    this.address,
    this.token,
    this.profilePic,
      this._id,
  );

  EngModel.fromJson({required Map<String, dynamic> json}) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    token = json['token'];
    profilePic = json['profilePic'] != null
        ? ProfilePic.fromJson(json['profilePic'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['token'] = this.token;
    data["_id"]=this._id;

    return data;
  }
  Map<String,dynamic> toMap(){
    return {
      'name' : userName,
      'email' : email,
      'phone' : phoneNumber,
      'token' : token,
      'image' : profilePic,
      'password':password,
      'address':address,
      "_id":_id,
    };
  }
}

class ProfilePic {
  String? secureUrl;
  String? publicId;

  ProfilePic(this.secureUrl, this.publicId);

  ProfilePic.fromJson(Map<String, dynamic> json) {
    secureUrl = json['secure_url'];
    publicId = json['public_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secure_url'] = this.secureUrl;
    data['public_id'] = this.publicId;
    return data;
  }
}
