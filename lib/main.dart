import 'package:flutterstarter/Core/index.dart';
import 'Features/Search/Presetnation/view/SearchScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'OZONE App',
          theme: AppThemes.lightTheme,
          home: const SearchScreen(),
        );
      },
    );
  }
}
