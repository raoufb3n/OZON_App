import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutterstarter/Core/Helper/Assets.dart';
import 'package:flutterstarter/Core/Helper/CustomBox.dart';
import 'package:flutterstarter/Core/index.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/LoginScreen.dart';

class Confirmationscreen extends StatelessWidget {
  const Confirmationscreen({super.key});

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
              'Merci pour votre inscription ! Une dernière étape,',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              maxLines: 2,
            ),
            verticalBox(8),
            Text(
              'Entrez le code à 6 chiffres que vous avez reçu sur votre boite mail.',
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
            ),
            verticalBox(16),
            OtpTextField(
              numberOfFields: 6,
              fieldWidth: 48.r,
              fieldHeight: 48.r,
              borderWidth: 3,
              focusedBorderColor: Theme.of(context).colorScheme.primary,
              borderColor: Theme.of(context).colorScheme.onSecondary,
              showFieldAsBox: true,
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),

              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
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
