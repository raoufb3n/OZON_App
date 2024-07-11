import 'package:flutterstarter/Core/Helper/Extensions.dart';
import 'package:flutterstarter/Core/index.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key, required this.title, required this.start, required this.participants,
  });
  final String title;
  final String start;
  final int participants;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.only(left: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  start,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              SizedBox(
                width: 160.w,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                  maxLines: 2,
                ),
              ),
              verticalBox(8),
              Row(
                children: [
                  Image.asset(
                    Assets.checkMark,
                    height: 20,
                  ),
                  horizontalBox(4),
                  Text(
                    '$participants présents · Évènement disponible',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 10.sp,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Stack(
            children: [
              Image.asset(
                Assets.eventPicture,
                height: 120.h,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(0.35),
                      borderRadius: BorderRadius.circular(200)),
                  child: Row(
                    children: [
                      Image.asset(Assets.joinEvnet, height: 20.w),
                      horizontalBox(8),
                      Image.asset(Assets.share, height: 20.w),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
