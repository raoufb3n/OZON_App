


import '../../../../../Core/index.dart';

class NumericAvatarWidget extends StatelessWidget {
  const NumericAvatarWidget({
    super.key, required this.num,
  });
  final String num;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        radius: 20,
        child: Text(
          num,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ));
  }
}