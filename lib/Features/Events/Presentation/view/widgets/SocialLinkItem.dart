



import 'package:flutterstarter/Core/index.dart';

class SocialLinkItem extends StatelessWidget {
  const SocialLinkItem({
    super.key,
    this.onTap,
    required this.smName,
    required this.imgPath,
  });
  final Function()? onTap;
  final String smName;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              imgPath,
              height: 32,
            ),
            Text(
              smName,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}