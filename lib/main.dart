import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveasy/businesLogic/langs/langs_cubit.dart';
import 'package:liveasy/businesLogic/phoneFill/phone_fill_cubit.dart';
import 'package:liveasy/businesLogic/selectProfile/selsect_profile_cubit.dart';
import 'package:liveasy/firebase_options.dart';
import 'package:liveasy/presntaion/selectLang.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LangsCubit()),
        BlocProvider(create: (context) => PhoneFillCubit()),
        BlocProvider(create: (context) => SelectProfileCubit()),


      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'liveasy',
        theme: ThemeData(
          fontFamily: "Roboto",
          primarySwatch: Colors.blue,
        ),
        home:  selectLang(),
      ),
    );
  }
}

