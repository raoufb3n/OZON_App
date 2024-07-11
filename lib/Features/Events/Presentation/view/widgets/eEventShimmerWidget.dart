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
                  baseColor: Theme.of(context).colorScheme.tertiary,
                  highlightColor: Theme.of(context).colorScheme.onSecondary,
                  child: Text(
                    'Lundi, 21 Juillet 2024 · 14:00',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              SizedBox(
                width: 160.w,
                child: Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.tertiary,
                  highlightColor: Theme.of(context).colorScheme.onSecondary,                  
                  child: Text(
                    'Plantation d’arbres pour créer une forêt',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                    maxLines: 2,
                  ),
                ),
              ),
              verticalBox(8),
              Row(
                children: [
                  Shimmer.fromColors(
                                      baseColor: Theme.of(context).colorScheme.tertiary,
                  highlightColor: Theme.of(context).colorScheme.onSecondary,
                    child: Image.asset(
                      Assets.checkMark,
                      height: 20,
                    ),
                  ),
                  horizontalBox(4),
                  Shimmer.fromColors(
                                      baseColor: Theme.of(context).colorScheme.tertiary,
                  highlightColor: Theme.of(context).colorScheme.onSecondary,
                    child: Text(
                      '81 présents · Évènement disponible',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 10.sp,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            child: Shimmer.fromColors(
                                baseColor: Theme.of(context).colorScheme.tertiary,
                highlightColor: Theme.of(context).colorScheme.onSecondary,
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
