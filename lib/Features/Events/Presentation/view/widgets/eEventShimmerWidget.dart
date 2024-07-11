import 'package:flutterstarter/Core/index.dart';

class Eeventshimmerwidget extends StatelessWidget {
  const Eeventshimmerwidget({
    super.key,
  });

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
                child: Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.onPrimary,
                  highlightColor: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(0.45),
                  child: Container(
                    width: 120,
                    height: 15,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: Shimmer.fromColors(
                    baseColor: Theme.of(context).colorScheme.onPrimary,
                    highlightColor: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(0.45),
                    child: Container(
                      width: 140,
                      height: 30,
                      color: Theme.of(context).colorScheme.onSecondary,
                    )),
              ),
              verticalBox(8),
              Row(
                children: [
                  Shimmer.fromColors(
                      baseColor: Theme.of(context).colorScheme.onPrimary,
                      highlightColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(0.45),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          shape: BoxShape.circle,
                        ),
                      )),
                  horizontalBox(4),
                  Shimmer.fromColors(
                    baseColor: Theme.of(context).colorScheme.onPrimary,
                    highlightColor: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(0.45),
                    child: Container(
                      width: 130,
                      height: 15,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.onPrimary,
              highlightColor:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(0.45),
              child: Image.asset(
                Assets.eventPicture,
                height: 120.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
