import 'package:flutterstarter/Core/Helper/Extensions.dart';
import 'package:flutterstarter/Core/index.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/widget/SMAuthSection.dart';

import 'widget/CustomInputTextField.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
        child: SingleChildScrollView(
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
                          Theme.of(context).colorScheme.primary.withOpacity(0.0)
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
                  const Expanded(
                    child: CustomInputTextField(
                      label: 'Prénom',
                      obsecure: false,
                    ),
                  ),
                  horizontalBox(8),
                  const Expanded(
                    child: CustomInputTextField(
                      label: 'Nom',
                      obsecure: false,
                    ),
                  ),
                ],
              ),
              verticalBox(16),
              const CustomInputTextField(
                label: 'Email',
                obsecure: false,
              ),
              verticalBox(16),
              const CustomInputTextField(label: 'Mot de passe', obsecure: true),
              verticalBox(16),
              const CustomInputTextField(label: 'Mot de passe', obsecure: true),
              verticalBox(12),
              CustomButton(
                title: 'S’inscrire',
                onPressed: () {},
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
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      )),
                ],
              ),
              
              Expanded(
                flex: 0,
                child: const SMAuthSection())
            ],
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
