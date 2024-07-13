import 'package:flutterstarter/Core/index.dart';

class DateCustomWidget extends StatelessWidget {
  const DateCustomWidget({
    super.key,
    required this.date,
    required this.time,
  });
  final String date;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          Assets.calendar,
          height: 32,
          color: Theme.of(context).colorScheme.primary,
        ),
        horizontalBox(4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            verticalBox(4),
            Text(
              time,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSecondary),
            )
          ],
        )
      ],
    );
  }
}
