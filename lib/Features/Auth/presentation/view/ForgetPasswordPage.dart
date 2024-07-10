import 'package:flutter/material.dart';
import 'package:flutterstarter/Core/Helper/Assets.dart';
import 'package:flutterstarter/Core/Helper/CustomBox.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/LoginScreen.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/widget/CustomInputTextField.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: CircleAvatar(
              radius: 28,
              backgroundColor:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(0.35),
              child: Image.asset(
                Assets.arrow,
                height: 24,
              )),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mot de passe oublié,',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            verticalBox(8),
            Text(
              'Entrez votre email pour recevoir votre code de réinitialisation de votre mot de passe.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            verticalBox(16),
            const CustomSimpleInput(),
            const Spacer(),
            CustomButton(title: 'Envoyer', onPressed: () {}),
            verticalBox(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Renvoyer un code dans 28 secondes',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
