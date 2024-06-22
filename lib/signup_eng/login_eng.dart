import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr1/main%20home/home.dart';
import 'package:pr1/signup_eng/signup.dart';
import '../Widgits/alert_dialog.dart';
import '../authonntacation_screans/auth_cubit_Engineer/auth_cubit.dart';
import '../authonntacation_screans/auth_cubit_Engineer/auth_state.dart';

class LogInEngineer extends StatelessWidget {
  LogInEngineer({Key? key}) : super(key: key);

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
//to do
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AuthCubit, AuthStates_eng>(
        //  create: (context) => AuthCubit(),
        //  child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
      if (state is LoginLoadingStateEng) {
        showAlertDialog(
            context: context,
            backgroundColor: Colors.white,
            content: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeIn,
              child: const Row(
                children: [
                  CupertinoActivityIndicator(color: Color(0xFF0C1044)),
                  SizedBox(
                    width: 12.5,
                  ),
                  Text(
                    "wait",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ));
      } else if (state is FailedToLoginStateEng) {
        showAlertDialog(
            context: context,
            backgroundColor: const Color(0xFFD7D9E5),
            content: Text(
              state.message,
              textDirection: TextDirection.rtl,
            ));
      } else if (state is LoginSuccessStateEng) {
        Navigator.pop(context); // عشان يخرج من alertDialog
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home()));
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: const Color(0xFF0C1044),
        body: Column(
          children: [
            Expanded(
              child: Container(
                //height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFF181A4D),
                    image: DecorationImage(
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
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView(children: [
                      Column(children: [
                        const Text(
                          "Log in ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (emailController.text.isNotEmpty) {
                              return null;
                            } else {
                              return "email must not be empty";
                            }
                          },
                          decoration: const InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.email_outlined,
                                color: Color(0xFF0C1044), size: 25),
                            hintText: "e_mail",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (passwordController.text.isNotEmpty) {
                              return null;
                            } else {
                              return "password must not be empty";
                            }
                          },
                          decoration: const InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.lock_outline_sharp,
                                color: Color(0xFF0C1044), size: 25),
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
                            onPressed: () {
                              if (formKey.currentState!.validate() == true) {
                                BlocProvider.of<AuthCubit>(context).login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35)),
                            textColor: Colors.white,
                            minWidth: double.infinity,
                            height: 55,
                            color: Color(0xFF181A4D),
                            elevation: 0.5,
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  state is LoginLoadingStateEng
                                      ? "Loading..."
                                      : "Login",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.5),
                                )),
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
                                        color: Color.fromARGB(255, 12, 19, 77),
                                      ))),
                            ),
                          ],
                        ),
                      ]),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
