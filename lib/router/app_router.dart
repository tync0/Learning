import 'package:auto_route/auto_route.dart';

import '../bottom_navigation.dart';
import '../features/home/screen/home_screen.dart';
import '../features/listening/listening_screen.dart';
import '../features/login_view/screen/login_screen.dart';
import '../features/onboard/screen/onboard_screen.dart';
import '../features/profile/screen/profile_screen.dart';
import '../features/reading/reading_screen.dart';
import '../features/sign_up/screen/signup.dart';
import '../features/vocabulary/screen/vocabulary_screen.dart';
import '../splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/splash',
          initial: true,
        ),
        AutoRoute(
          page: OnBoardRoute.page,
          path: '/onboard',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: '/signup',
        ),
        AutoRoute(
          page: BottomNavBarRoute.page,
          path: '/bottomnavbar',
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: 'home',
              initial: true,
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            ),
            AutoRoute(
              page: VocabularyRoute.page,
              path: 'vocabulary',
            ),
          ],
        ),
        AutoRoute(
          page: ReadingRoute.page,
          path: '/reading',
        ),
        AutoRoute(
          page: ListeningRoute.page,
          path: '/listening',
        ),
      ];
}
