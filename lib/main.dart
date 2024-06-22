import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr1/layout/layout_cubit.dart';
import 'package:pr1/main%20home/screans%20of%20Home/posts/new%20post.dart';
import 'package:pr1/profile/engineer.dart';
import 'package:pr1/shared/bloc_observer/bloc_observer.dart';
import 'package:pr1/shared/constants/constants.dart';
import 'package:pr1/shared/network/local_network.dart';
import 'package:flutter/services.dart';
import 'authonntacation_screans/auth_cubit_Engineer/auth_cubit.dart';
import 'main home/screans of Home/home_comunity.dart';
import 'main home/screans of Home/posts/cubit_post/cubit_post.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization();
  userToken = await CacheNetwork.getCacheData(key: 'token');
  currentPassword = await CacheNetwork.getCacheData(key: 'password');
  debugPrint("User token is : $userToken");
  debugPrint(
      "Current Password is : $currentPassword"); // Ensures that the necessary bindings are ready
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFF0C1044),
  ));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider<ImageCubit>(
          create: (context) => ImageCubit(),
        ),
        BlocProvider(
            create: (context) =>
            LayoutCubit()
              ..getUserData()

        ),
      ],
      child: MaterialApp(

          debugShowCheckedModeBanner: false,
          home: CommunityPage(),
          // home: userToken != null ? const signAll() : start_page()
       ),
    );
  }
}
