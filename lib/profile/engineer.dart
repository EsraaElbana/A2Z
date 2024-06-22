import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/layout_cubit.dart';
import '../layout/layout_state.dart';
import 'edite profile.dart';

class engineerEditing extends StatefulWidget {
  const engineerEditing({Key? key}) : super(key: key);

  @override
  State<engineerEditing> createState() => _engineerEditingState();
}

class _engineerEditingState extends State<engineerEditing> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  // File? image;
  //
  // Future pickerGallery() async {
  //   final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     image = File(myfile!.path);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    nameController.text = cubit.engModel!.userName!;
    phoneController.text = cubit.engModel!.phoneNumber!;
    emailController.text = cubit.engModel!.email!;
    addressController.text = cubit.engModel!.address![0];
    passwordController.text = cubit.engModel!.password!;
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    // Future pickerCamera() async {
    //   final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    //
    //   setState(() {
    //     image = File(myfile!.path);
    //   });
    // }
    return BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
    builder: (context, state) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    if (cubit.engModel == null) cubit.getUserData();
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          title: const Text(
            "Editing",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Container(
                    //color: Colors.deepPurple,
                    // height: MediaQuery.of(context).size.height*0.9,
                    child: Column(
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 28.0),
                                child: InkWell(
                                  onTap: () {
                                    // pickerGallery();
                                    // Navigator.push(context, route)
                                  },
                                  child: CircleAvatar(
                                    radius: 59,
                                    backgroundColor: Colors.white,
                                     backgroundImage: NetworkImage(cubit.engModel!.profilePic!.secureUrl!),
                                     // AssetImage("assets/Ellipse 2.png")as ImageProvider:
                                     //
                                     //  NetworkImage( cubit.engModel!.profilePic!.secureUrl!
                                     //  ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: GestureDetector(
                                  // onTap: (){
                                  //   pickerCamera();
                                  // },
                                  child: CircleAvatar(
                                    radius: 15,
                                    // backgroundImage:image==null?null:FileImage(image!),
                                    backgroundColor: Color(0xFF12133C),
                                    child: InkWell(
                                      onTap: () {
                                        cubit.pickerGallery();
                                      },
                                      child: Image.asset(
                                        "assets/Vector.png",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    editProfile("Name", nameController),
                    editProfile("E-mail", emailController),
                    // edit_profile("Password",passwordController),
                    editProfile("Country / Region", addressController),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          75 * ffem, 15 * ffem, 75 * ffem, 10 * ffem),
                      child: BlocConsumer<LayoutCubit,LayoutStates>(
                        listener: (context,state)
                        {
                          if( state is profilePicSuccessState )
                          {
                            showSnackBarItem(context, "Data Updated Successfully", true);
                            Navigator.pop(context);
                          }
                          if( state is profilePicFailedState )
                          {
                            showSnackBarItem(context, state.errorf, false);
                          }
                        },
                     builder: (context,state)
                {
                        return MaterialButton(
                          onPressed: () {


                              if( cubit.profileImage != null  )
                              {
                                cubit.postPictureProfile(cubit.profileImage!);
                              }
                              else
                              {
                                showSnackBarItem(context, 'Please, Enter all Data !!', false);
                              }

                            // if (cubit.profileImage?.path != null) {
                            //   cubit.postPictureProfile(cubit.profileImage!);
                            // }
                          },
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          textColor: Colors.white,
                          minWidth: double.infinity,
                          height: 40 * ffem,
                          color: Colors.indigo[900],
                          elevation: 0.5,
                          child:  const Text(
                            "Save Changes",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        );}
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );}
    );
  }
  void showSnackBarItem(BuildContext context,String message,bool forSuccessOrFailure){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message),backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,));
  }
}
