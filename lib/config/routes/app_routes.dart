import '../../features/home/presentation/screens/home_screen.dart';

class AppRoutes {
  static String homeScreenRoute = 'homeScreen';

  static get routes {
    return {
      AppRoutes.homeScreenRoute: (context) => const HomeScreen(),
    };
  }
}
