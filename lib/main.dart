import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/coins/coins_bloc.dart';
import 'core/router.dart';
import 'core/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/images/cloud.png'), context);
    precacheImage(const AssetImage('assets/images/win.png'), context);
    precacheImage(const AssetImage('assets/images/balloon1.png'), context);
    precacheImage(const AssetImage('assets/images/balloon2.png'), context);
    precacheImage(const AssetImage('assets/images/balloon3.png'), context);
    precacheImage(const AssetImage('assets/images/balloon4.png'), context);
    precacheImage(const AssetImage('assets/images/balloon5.png'), context);
    precacheImage(const AssetImage('assets/images/balloon6.png'), context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return CoinsBloc();
        }),
      ],
      child: MaterialApp.router(
        theme: themeData,
        routerConfig: routerConf,
      ),
    );
  }
}
