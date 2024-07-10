


import 'package:flutterstarter/Core/index.dart';

class DateCustomWidget extends StatelessWidget {
  const DateCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          Assets.calendar,
          height: 32,
          color: Theme.of(context).colorScheme.primary,
        ),
        horizontalBox(4),
        Column(
          children: [
            Text(
              'Lundi, 21 Juillet 2024',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary),
            ),
            verticalBox(4),
            Text(
              '14:00 · 20:00 AM GMT +8',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary),
            )
          ],
        )
      ],
    );
  }
}

