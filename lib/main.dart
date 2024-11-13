import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/coins/coins_bloc.dart';
import 'core/config/router.dart';
import 'core/config/themes.dart';

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
    precacheImage(const AssetImage('assets/images/balloon.png'), context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CoinsBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}

// splash
// balloon
