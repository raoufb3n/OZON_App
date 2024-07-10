import 'package:flutterstarter/Core/Helper/Extensions.dart';
import 'package:flutterstarter/Core/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
        child: Column(
          children: [
            Container(
              height: 75.r,
              width: 75.r,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withOpacity(0.0)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
            const CustomInputTextField(
              label: 'Email ou numéro de téléphone',
              obsecure: false,
            ),
            verticalBox(16),
            const CustomInputTextField(label: 'Mot de passe', obsecure: true),
            verticalBox(8),
            TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Vous avez oublié votre mot de passe ?',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ],
                )),
            verticalBox(12),
            SizedBox(
              width: context.screenWidth,
              child: ElevatedButton(
                onPressed: () {},
                style: Theme.of(context).filledButtonTheme.style,
                child: Text(
                  'Connexion',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
            verticalBox(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vous n\'avez pas de compte ?',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
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
            const Spacer(),
            const SMAuthSection()
          ],
        ),
      )),
    );
  }
}

class SMAuthSection extends StatelessWidget {
  const SMAuthSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 52),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
              ),
              horizontalBox(8),
              Text(
                'Ou continuer avec',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
              horizontalBox(8),
              Expanded(
                child: Container(
                  height: 1,
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
              ),
            ],
          ),
          verticalBox(18),
          SizedBox(
            width: context.screenWidth * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Assets.facebook,
                  height: 32,
                ),
                Image.asset(
                  Assets.googleIcon,
                  height: 32,
                ),
                Image.asset(
                  Assets.apple,
                  height: 32,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomInputTextField extends StatelessWidget {
  const CustomInputTextField({
    super.key,
    required this.label,
    required this.obsecure,
  });
  final String label;
  final bool obsecure;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        verticalBox(8),
        TextFormField(
          obscureText: obsecure,
          keyboardType: TextInputType.name,
          onChanged: (value) {},
          validator: (value) {},
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
          decoration: InputDecoration(
              suffixIconConstraints: BoxConstraints(
                minHeight: 24.r,
                maxHeight: 24.r,
              ),
              suffixIcon: obsecure
                  ? Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Image.asset(
                        Assets.eye,
                      ),
                    )
                  : null,
              hintText: 'email@gmail.com',
              hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onTertiary,
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onTertiary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onTertiary)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.onPrimary,
              contentPadding: const EdgeInsets.all(16)),
        ),
      ],
    );
  }
}
