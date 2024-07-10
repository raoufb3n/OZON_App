import 'package:flutterstarter/Core/Helper/Extensions.dart';
import 'package:flutterstarter/Core/index.dart';

class SMAuthSection extends StatelessWidget {
  const SMAuthSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 52),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  color: Theme.of(context).colorScheme.onSecondary,
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
                  color: Theme.of(context).colorScheme.onSecondary,
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
