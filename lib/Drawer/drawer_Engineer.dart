import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr1/profile/engineer.dart';
import '../layout/layout_cubit.dart';
import '../layout/layout_state.dart';
import '../profile/setting.dart';
class drawerEngineer extends StatefulWidget {
  const drawerEngineer({Key? key}) : super(key: key);

  @override
  State<drawerEngineer> createState() => _drawerEngineerState();
}

class _drawerEngineerState extends State<drawerEngineer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          if (cubit.engModel == null) cubit.getUserData();
          return Container(
            child: Drawer(
              width: 240,
              backgroundColor: Colors.white,
              child: ListView(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 10),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: cubit.image == null
                                      ? AssetImage("assets/Ellipse 2.png")
                                  as ImageProvider
                                      :NetworkImage ( cubit.engModel!.profilePic!.secureUrl!),
                                  // backgroundImage: NetworkImage(cubit
                                  //             .engModel!.profilePic!.secureUrl ==
                                  //         null
                                  //     ? "assets/Ellipse 2.png"
                                  //     : cubit.engModel!.profilePic!.secureUrl!),
                                  // child: Image.asset("assets/Ellipse 2.png"),
                                ),
                              ),
                               Text(cubit.engModel!.userName!),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.menu_rounded)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return engineerEditing();
                        },
                      )),
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffdcdcdc)),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Row(children: const [
                          Icon(Icons.mode_edit_outline_outlined),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Edite Profile",
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return settingProfileEngineer();
                        },
                      )),
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffdcdcdc)),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const Row(children: [
                          Icon(Icons.settings_outlined),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Setting",
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffdcdcdc)),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const Row(children: [
                          Icon(Icons.output_sharp),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Log Out",
                          ),
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

//Image.asset("assets/Ellipse 2.png"),
