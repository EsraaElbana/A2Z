// class model {
//   String? message;
//   SaveEngineer? saveEngineer;
//
//   model({this.message, this.saveEngineer});
//
//   model.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     saveEngineer = json['saveEngineer'] != null
//         ? new SaveEngineer.fromJson(json['saveEngineer'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.saveEngineer != null) {
//       data['saveEngineer'] = this.saveEngineer!.toJson();
//     }
//     return data;
//   }
// }
//
// class SaveEngineer {
//   String? userName;
//   String? email;
//   String? password;
//   bool? isConfirmed;
//   bool? isOnline;
//   String? phoneNumber;
//   List<String>? address;
//   LicencePicture? licencePicture;
//   String? status;
//   String? gender;
//   String? customId;
//   String? sId;
//   List<Null>? gallery;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//
//   SaveEngineer(
//       {this.userName,
//         this.email,
//         this.password,
//         this.isConfirmed,
//         this.isOnline,
//         this.phoneNumber,
//         this.address,
//         this.licencePicture,
//         this.status,
//         this.gender,
//         this.customId,
//         this.sId,
//         this.gallery,
//         this.createdAt,
//         this.updatedAt,
//         this.iV});
//
//   SaveEngineer.fromJson(Map<String, dynamic> json) {
//     userName = json['userName'];
//     email = json['email'];
//     password = json['password'];
//     isConfirmed = json['isConfirmed'];
//     isOnline = json['isOnline'];
//     phoneNumber = json['phoneNumber'];
//     address = json['address'].cast<String>();
//     licencePicture = json['licencePicture'] != null
//         ? new LicencePicture.fromJson(json['licencePicture'])
//         : null;
//     status = json['status'];
//     gender = json['gender'];
//     customId = json['customId'];
//     sId = json['_id'];
//     if (json['Gallery'] != null) {
//       gallery = <Null>[];
//       json['Gallery'].forEach((v) {
//         gallery!.add(new Null.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userName'] = this.userName;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     data['isConfirmed'] = this.isConfirmed;
//     data['isOnline'] = this.isOnline;
//     data['phoneNumber'] = this.phoneNumber;
//     data['address'] = this.address;
//     if (this.licencePicture != null) {
//       data['licencePicture'] = this.licencePicture!.toJson();
//     }
//     data['status'] = this.status;
//     data['gender'] = this.gender;
//     data['customId'] = this.customId;
//     data['_id'] = this.sId;
//     if (this.gallery != null) {
//       data['Gallery'] = this.gallery!.map((v) => v?.toJson()).toList();
//     }
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class LicencePicture {
//   String? secureUrl;
//   String? publicId;
//
//   LicencePicture({this.secureUrl, this.publicId});
//
//   LicencePicture.fromJson(Map<String, dynamic> json) {
//     secureUrl = json['secure_url'];
//     publicId = json['public_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['secure_url'] = this.secureUrl;
//     data['public_id'] = this.publicId;
//     return data;
//   }
// }