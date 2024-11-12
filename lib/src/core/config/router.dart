import 'package:go_router/go_router.dart';

import '../../features/home/pages/balloon_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/howto_page.dart';
import '../../features/home/pages/level_page.dart';
import '../../features/home/pages/settings_page.dart';
import '../../features/home/pages/spin_page.dart';
import '../../features/home/pages/splash_page.dart';

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
