import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:flutterstarter/Core/Helper/Extensions.dart';
import 'package:flutterstarter/Core/index.dart';
import 'package:flutterstarter/Core/ui/Animation.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/widget/SMAuthSection.dart';
import 'package:flutterstarter/Features/Auth/presentation/viewModel/cubit/auth_cubit.dart';
import 'package:flutterstarter/Features/Home/presentation/view/HomeScreen.dart';

import 'widget/CustomInputTextField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                    Assets.wavingHand,
                  ),
                ),
                verticalBox(16),
                Text(
                  'Se connecter',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                verticalBox(24),
                CustomInputTextField(
                  label: 'Email ou numéro de téléphone',
                  obsecure: false,
                  inputType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Veuillez entrer votre email ou numéro de téléphone';
                    }
                    if (!p0.isEmail()) {
                      return 'Veuillez entrer un email valide';
                    }
                    return null;
                  },
                ),
                verticalBox(16),
                CustomInputTextField(
                  label: 'Mot de passe',
                  obsecure: true,
                  controller: passwordController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Veuillez entrer votre mot de passe';
                    } else if (p0.length < 6) {
                      return 'Le mot de passe doit contenir au moins 6 caractères';
                    }
                    return null;
                  },
                ),
                verticalBox(8),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Vous avez oublié votre mot de passe ?',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                        ),
                      ],
                    )),
                verticalBox(12),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return state.when(
                        initial: () {
                             return CustomButton(
                      title: 'Connexion',
                      onPressed: () {
                        context.read<AuthCubit>().login(emailController.text,
                         passwordController.text);
                      },
                    );
                        },
                        loading: () {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          );
                        },
                        loaded: () {
                          return CustomButton(
                            title: 'Success',
                            onPressed: () {
                              context.pushReplacement(FadeSlidePageTransition(
                                  page: const Homescreen()));
                            },
                          );
                        },
                        error: (message) {
                          return Center(
                              child: Text(
                            message.toString(),
                            style: Theme.of(context).textTheme.labelLarge!,
                          ));
                        });
                 
                  },
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
                        onPressed: () {},
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
                verticalBox(48),
                const SMAuthSection()
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
