import 'package:go_router/go_router.dart';

import '../../pages/balloon_page.dart';
import '../../pages/home_page.dart';
import '../../pages/howto_page.dart';
import '../../pages/level_page.dart';
import '../../pages/settings_page.dart';
import '../../pages/spin_page.dart';
import '../../pages/splash_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: 'level',
          builder: (context, state) => const LevelPage(),
          routes: [
            GoRoute(
              path: 'balloon',
              builder: (context, state) => const BalloonPage(),
            ),
          ],
        ),
        GoRoute(
          path: 'howto',
          builder: (context, state) => const HowtoPage(),
        ),
        GoRoute(
          path: 'spin',
          builder: (context, state) => const SpinPage(),
        ),
      ],
    ),
  ],
);