import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../Drawer/drawer_Engineer.dart';
import '../../layout/layout_cubit.dart';
import '../../layout/layout_state.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<File> _images = [];

  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        _images.add(File(image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          if (cubit.engModel == null) cubit.getUserData();
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            drawer: drawerEngineer(),
            body: cubit.engModel != null
                ? Column(
                    children: [
                      Expanded(
                        flex: 14,
                        child: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 7),
                                        child: CircleAvatar(
                                          radius: 70,
                                          backgroundImage: cubit.image == null
                                              ? AssetImage(
                                                      "assets/Ellipse 2.png")
                                                  as ImageProvider
                                              : NetworkImage(cubit.engModel!
                                                  .profilePic!.secureUrl!),
                                          // NetworkImage(cubit
                                          //     .engModel!
                                          //     .profilePic!
                                          //     .secureUrl!),
                                          // child: Image.network(cubit
                                          //       .engModel!
                                          //       .profilePic!
                                          //       .secureUrl!=null? cubit.engModel!.profilePic!.secureUrl!:cubit.engModel!.profilePic!.secureUrl!),
                                        ),
                                      ),
                                      Text(cubit.engModel!.userName!),
                                      const Text("Interior designer"),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const ImageIcon(
                                              AssetImage("assets/locate.png")),
                                          Text(cubit.engModel!.address![0]),
                                        ],
                                      ),
                                      // Text("Rate")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Divider(
                              endIndent: 15,
                              indent: 15,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("My Work",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 15,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0,
                            ),
                            itemCount: _images.length + 1,
                            itemBuilder: (context, index) {
                              if (index == _images.length) {
                                return GestureDetector(
                                  onTap: () {
                                    _pickImage(ImageSource.gallery);
                                  },
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(Icons.add),
                                  ),
                                );
                              } else {
                                return Image.file(_images[index]);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        });
  }
}
