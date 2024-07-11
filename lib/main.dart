import 'package:flutterstarter/Core/Helper/DioHelper.dart';
import 'package:flutterstarter/Core/Routing/AppRouter.dart';
import 'package:flutterstarter/Core/index.dart';
import 'package:flutterstarter/Features/Auth/data/model/authusermodel/user.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/RegisterScreen.dart';
import 'package:flutterstarter/Features/Auth/presentation/viewModel/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstarter/Features/Auth/presentation/viewModel/cubit/started_app_cubit.dart';
import 'package:flutterstarter/Features/Home/presentation/view/HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(create: (context) => StartedAppCubit()..onAppStarted())
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'OZONE App',
            theme: AppThemes.lightTheme,
            onGenerateRoute: AppRouter().generateRoute,
            onUnknownRoute: AppRouter().onUnknownRoute,
            home: BlocBuilder<StartedAppCubit, StartedAppState>(
              builder: (context, state) {
                return state.when(initial: () {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }, loading: () {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }, error: (message) {
                  return Scaffold(
                    body: Center(
                      child: Text(message),
                    ),
                  );
                }, authenticated: (User? user) {
                  return const Homescreen();
                }, unothanticated: () {
                  return const Registerscreen();
                });
              },
            ),
          );
        },
      ),
    );
  }
}
