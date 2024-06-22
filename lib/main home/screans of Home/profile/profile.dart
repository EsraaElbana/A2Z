// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:pr1/authonntacation_screans/auth_cubit/auth_cubit.dart';
// import 'package:pr1/screans%20of%20Home/profile/rate%20for%20eng.dart';
// import '../../Drawer/drawer_Engineer.dart';
// import '../../authonntacation_screans/auth_cubit/auth_state.dart';
// import '../../signup_eng/login_eng.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   List<File> _images = [];
//
//   Future<void> _pickImage(ImageSource source) async {
//     final image = await ImagePicker().pickImage(source: source);
//     if (image != null) {
//       _images.add(File(image.path));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => AuthCubit(),
//         child: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
//           if (state is RegisterSuccessState) {
//             Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const LogInEngineer(),
//                 ));
//           } else if (state is RegisterFailedState) {
//             showDialog(
//                 context: context,
//                 builder: ((context) => AlertDialog(
//                       content: Text(
//                         "failed ",
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                       backgroundColor: Color(0xFF181A4D),
//                     )));
//           }
//         }, builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               elevation: 0,
//               backgroundColor: Colors.white,
//               iconTheme: IconThemeData(color: Colors.black),
//             ),
//             drawer: drawerEngineer(),
//             body: Column(
//               children: [
//                 Expanded(
//                   flex: 14,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 0),
//                     child: Row(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 6,
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                               top: 20,
//                             ),
//                             child: Column(
//                               // crossAxisAlignment: CrossAxisAlignment.end,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(bottom: 7),
//                                   child: CircleAvatar(
//                                     radius: 70,
//                                     child: Image.asset("assets/Ellipse 2.png"),
//                                   ),
//                                 ),
//                                 Text("User name"),
//                                 Text("Interior designer"),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     ImageIcon(AssetImage("assets/locate.png")),
//                                     Text("city"),
//                                   ],
//                                 ),
//                                 Center(
//                                   child: StarRating(
//                                     maxRating: 5,
//                                     onChanged: (rating) {
//                                       print('Selected rating: $rating');
//                                     },
//                                     size: 33,
//                                     color: Colors.amber,
//                                     initialRating: 0,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                     flex: 1,
//                     child: SizedBox(
//                       child: Divider(
//                         endIndent: 15,
//                         indent: 15,
//                         thickness: 1,
//                         color: Colors.grey,
//                       ),
//                     )),
//                 Expanded(
//                     flex: 2,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text("your Work",
//                               style: TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.normal)),
//                         ],
//                       ),
//                     )),
//                 Expanded(
//                   flex: 15,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 4.0,
//                         mainAxisSpacing: 4.0,
//                       ),
//                       itemCount: _images.length + 1,
//                       itemBuilder: (context, index) {
//                         if (index == _images.length) {
//                           return GestureDetector(
//                             onTap: () {
//                               _pickImage(ImageSource.gallery);
//                             },
//                             child: Container(
//                               height: 100,
//                               decoration: BoxDecoration(
//                                   color: Colors.grey[200],
//                                   borderRadius: BorderRadius.circular(20)),
//                               child: Icon(Icons.add),
//                             ),
//                           );
//                         } else {
//                           return Image.file(_images[index]);
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }));
//   }
// }
