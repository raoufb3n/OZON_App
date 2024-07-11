import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:flutterstarter/Core/index.dart';
import 'package:flutterstarter/Core/ui/Animation.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/LoginScreen.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/widget/SMAuthSection.dart';
import 'package:flutterstarter/Features/Auth/presentation/viewModel/cubit/auth_cubit.dart';
import 'package:flutterstarter/Features/Home/presentation/view/HomeScreen.dart';

import 'widget/CustomInputTextField.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    password1Controller.dispose();
    nomController.dispose();
    prenomController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  String helperText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 75.r,
                  width: 75.r,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Image.asset(
                    Assets.cat,
                  ),
                ),
                verticalBox(16),
                Text(
                  'Inscription',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                verticalBox(24),
                Row(
                  children: [
                    Expanded(
                      child: CustomInputTextField(
                        key: const ValueKey('prenom'),
                        label: 'Prénom',
                        controller: prenomController,
                        obsecure: false,
                        validator: (p1) {
                          if (p1 == null || p1.isEmpty) {
                            return 'Prénom est obligatoire';
                          }
                          if (!p1.isUsername()) {
                            return 'Prénom invalide';
                          }
                          return null;
                        },
                      ),
                    ),
                    horizontalBox(8),
                    Expanded(
                      child: CustomInputTextField(
                        label: 'Nom',
                        obsecure: false,
                        controller: nomController,
                        validator: (p1) {
                          if (p1 == null || p1.isEmpty) {
                            return 'Prénom est obligatoire';
                          }
                          if (!p1.isUsername()) {
                            return 'Prénom invalide';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                verticalBox(16),
                CustomInputTextField(
                  key: const ValueKey('email'),
                  label: 'Email',
                  obsecure: false,
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Email est obligatoire';
                    }
                    if (!p0.isEmail()) {
                      return 'Email invalide';
                    }
                    return null;
                  },
                ),
                verticalBox(16),
                CustomInputTextField(
                  label: 'Mot de passe',
                  obsecure: true,
                  controller: password1Controller,
                  validator: (p1) {
                    if (p1 == null || p1.isEmpty) {
                      return 'Mot de pass est obligatoire';
                    }

                    return null;
                  },
                ),
                verticalBox(16),
                CustomInputTextField(
                  label: 'Confirmez mot de passe',
                  obsecure: true,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Mot de pass est obligatoire';
                    }
                    if (p0 != password1Controller.text) {
                      return 'Mot de passe ne correspond pas';
                    }
                  },
                ),
                verticalBox(12),
                SizedBox(
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return state.when(initial: () {
                        return CustomButton(
                          title: 'S’inscrire',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().register(
                                  emailController.text,
                                  password1Controller.text,
                                  nomController.text,
                                  prenomController.text);
                              context.pushReplacement(FadeSlidePageTransition(
                                  page: const Homescreen()));
                            }
                          },
                        );
                      }, loading: () {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        );
                      }, error: (e) {
                        return Center(
                            child: Text(
                          e.toString(),
                          style: Theme.of(context).textTheme.labelLarge!,
                        ));
                      }, loaded: () {
                        return CustomButton(
                            title: 'Success',
                            onPressed: () {
                              context.pushReplacement(FadeSlidePageTransition(
                                  page: const Homescreen()));
                            });
                      });
                    },
                  ),
                ),
                verticalBox(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Vous n\'avez pas de compte ?',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    TextButton(
                        onPressed: () {
                          context.pushReplacement(FadeSlidePageTransition(
                              page: const LoginScreen()));
                        },
                        child: Text(
                          'Inscription',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        )),
                  ],
                ),
                const Expanded(flex: 0, child: const SMAuthSection())
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).filledButtonTheme.style,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
