import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:flutterstarter/Core/Helper/Extensions.dart';
import 'package:flutterstarter/Core/index.dart';
import 'package:flutterstarter/Core/ui/Animation.dart';
import 'package:flutterstarter/Features/Auth/data/model/authusermodel/user.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/RegisterScreen.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/widget/SMAuthSection.dart';
import 'package:flutterstarter/Features/Auth/presentation/viewModel/cubit/auth_cubit.dart';
import 'package:flutterstarter/Features/Home/presentation/view/HomeScreen.dart';
import 'widget/CustomInputTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obsecure = true;
  void onTap() {
    setState(() {
      obsecure = !obsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (user) {
                showModalBottomSheet(
                    context: context,
                    constraints: BoxConstraints(
                      minHeight: 200.r,
                      maxHeight: 200.r,
                    ),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Vous vous êtes connecté avec succès',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                            verticalBox(16),
                            CustomButton(
                              title: 'Continue',
                              onPressed: () {
                                context.pushReplacement(FadeSlidePageTransition(
                                    page: const Homescreen()));
                              },
                            )
                          ],
                        ),
                      );
                    });
              },
            );
          },
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
                    isPass: false,
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
                    isPass: true,
                    obsecure: obsecure,
                    controller: passwordController,
                    onTap: onTap,
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
                              if (formKey.currentState!.validate()) {
                                context.read<AuthCubit>().login(
                                    emailController.text,
                                    passwordController.text);
                              }
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
                        loaded: (user) {
                          return CustomButton(
                            title: 'Success',
                            onPressed: () {
                              context.pushReplacement(FadeSlidePageTransition(
                                  page: const Homescreen()));
                            },
                          );
                        },
                        error: (message) {
                          return Column(
                            children: [
                              CustomButton(
                                title: 'Essayer à nouveau',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().login(
                                        emailController.text,
                                        passwordController.text);
                                  }
                                },
                              ),
                              Center(
                                  child: Text(
                                message.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error),
                              )),
                            ],
                          );
                        },
                      );
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
                          onPressed: () {
                            context.pushReplacement(FadeSlidePageTransition(
                                page: const Registerscreen()));
                          },
                          child: Text(
                            'Inscription',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          )),
                    ],
                  ),
                  verticalBox(48),
                  const SMAuthSection()
                ],
              ),
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
