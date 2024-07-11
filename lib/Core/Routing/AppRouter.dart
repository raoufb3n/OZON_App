import 'package:flutterstarter/Core/Routing/Routes.dart';
import 'package:flutterstarter/Core/index.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/LoginScreen.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/RegisterScreen.dart';
import 'package:flutterstarter/Features/Events/Presentation/view/EventDetailsScreen.dart';
import 'package:flutterstarter/Features/Events/Presentation/view/EventScreen.dart';
import 'package:flutterstarter/Features/Home/presentation/view/HomeScreen.dart';
import 'package:flutterstarter/Features/Search/Presetnation/view/SearchScreen.dart';

class AppRouter {
  AppRouter() {}

  Route<dynamic>? generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const Homescreen());
      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Routes.events:
        return MaterialPageRoute(builder: (_) => const EventsScren());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const Registerscreen());
      case Routes.eventDetails:
        return MaterialPageRoute(builder: (_) => const Eventdetailsscreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Center(
                  child: Text(
                    'No Route Defined',
                    style: TextStyle(color: Colors.black),
                  ),
                ));
    }
  }

  Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (_) => const Center(
              child: Text(
                'No Route Defined',
                style: TextStyle(color: Colors.black),
              ),
            ));
  }
}
