import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr1/authonntacation_screans/auth_cubit_client/auth_cubit.dart';
import 'package:pr1/client/home_page%20for%20client.dart';

import 'package:pr1/signup_eng/signup.dart';

import '../../Widgits/alert_dialog.dart';
import '../../authonntacation_screans/auth_cubit_Engineer/auth_state.dart';
import '../../authonntacation_screans/auth_cubit_client/auth_state.dart';

class loginClient extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  loginClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final AuthCubitClient authCubit = BlocProvider.of<AuthCubitClient>(context);
    return Scaffold(
      backgroundColor: Color(0xFF181A4D),
      body: Column(
        children: [
          Expanded(
            child: Container(
              //height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF181A4D),
                  image: const DecorationImage(
                    image: AssetImage("assets/logo.png"),
                    // fit: BoxFit.scaleDown
                  )),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 5, 2, 0),
              width: double.infinity,
              //height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffc58a00),
                  // border: 3px solid rgba(210, 171, 69, 1)// Change border color here
                  width: 2, // Set border width
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                child: BlocProvider(
                  create: (context) => AuthCubitClient(),
                  child: BlocConsumer<AuthCubitClient, AuthStates>(
                    listener: (context, state) {
                      if (state is LoginLoadingState) {
                        showAlertDialog(
                            context: context,
                            backgroundColor: Colors.white,
                            content: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn,
                              child: Row(
                                children: [
                                  const CupertinoActivityIndicator(
                                      color: Colors.cyanAccent),
                                  SizedBox(
                                    width: 12.5,
                                  ),
                                  const Text(
                                    "wait",
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ));
                      } else if (state is FailedToLoginState) {
                        showAlertDialog(
                            context: context,
                            backgroundColor: Colors.red,
                            content: Text(
                              state.message,
                              textDirection: TextDirection.rtl,
                            ));
                      } else if (state is LoginSuccessState) {
                        Navigator.pop(context); // عشان يخرج من alertDialog
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homePageClient()));
                      }
                    },
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Form(
                          key:formKey ,
                          child: Column(children: [
                            const Text(
                              "Log in ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: email,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (email.text.isNotEmpty) {
                                  return null;
                                } else {
                                  return "email must not be empty";
                                }
                              },
                              decoration: const InputDecoration(
                                isDense: true,
                                prefixIcon: Icon(Icons.email_outlined,
                                    color: Color(0xFF181A4D), size: 25),
                                hintText: "e_mail",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            TextFormField(
                              controller: password,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (password.text.isNotEmpty) {
                                  return null;
                                } else {
                                  return "password must not be empty";
                                }
                              },
                              decoration: const InputDecoration(
                                isDense: true,
                                prefixIcon: Icon(Icons.lock_outline_sharp,
                                    color: Color(0xFF181A4D), size: 25),
                                hintText: "password",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 30, 50, 0.25),
                              child: MaterialButton(
                                onPressed: ()async {
                                  if (formKey.currentState!.validate() ) {
                                    BlocProvider.of<AuthCubitClient>(context)
                                        .loginClient(
                                      email: email.text,
                                      password: password.text,
                                    );
                                  }
                                  // setState(() {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>  homePageClient()));
                                  // });
                                },
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35)),
                                textColor: Colors.white,
                                minWidth: double.infinity,
                                height: 55,
                                color: Color(0xFF181A4D),
                                elevation: 0.5,
                                child: const Text(
                                  "Login ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("i don't have an Account "),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (context) {
                                      return SignUpEngineer();
                                    }));
                                  },
                                  child: const Center(
                                      child: Text("sign up.",
                                          style: TextStyle(
                                            color: Color(0xFF181A4D),
                                          ))),
                                ),
                              ],
                            ),
                          ]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
