import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstarter/Features/Home/viewModel/cubit/layout_cubit.dart';

import '../../../../Core/index.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final cubit = LayoutCubit.get(context);
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: cubit.pages[cubit.currentIndex],
          bottomNavigationBar: NavigationBar(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 4.0,
            selectedIndex: cubit.currentIndex,
            onDestinationSelected: (value) {
              cubit.changeLayout(value);
            
            },
            shadowColor: Colors.black.withOpacity(0.5),
            indicatorColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: [
              NavigationDestination(
                icon: Image.asset(
                  Assets.home,
                  height: 24.h,
                  color: cubit.currentIndex ==0 ?
                  Theme.of(context).colorScheme.primary :
                  Theme.of(context).colorScheme.onSecondary
                  ,
                ),
                label: 'Accueil',
              ),
              NavigationDestination(
                icon: Image.asset(
                  Assets.search,
                  height: 24.h,
                  color: cubit.currentIndex ==1 ?
                  Theme.of(context).colorScheme.primary :
                  Theme.of(context).colorScheme.onSecondary
                  ,
                ),
                label: 'Recherche',
              ),
              NavigationDestination(
                icon: CircleAvatar(
                  radius: 28,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Image.asset(Assets.add, height: 20.h),
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Image.asset(
                  Assets.tree,
                  height: 24.h,
                  color: cubit.currentIndex ==3 ?
                  Theme.of(context).colorScheme.primary :
                  Theme.of(context).colorScheme.onSecondary
                  ,                  
                ),
                label: 'Accueil',
              ),
              NavigationDestination(
                icon: Image.asset(
                  Assets.user,
                  color: cubit.currentIndex ==4 ?
                  Theme.of(context).colorScheme.primary :
                  Theme.of(context).colorScheme.onSecondary
                  ,                  
                  height: 24.h,
                ),
                label: 'Accueil',
              ),
            ],
          ),
        );
      },
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              ),
              horizontalBox(6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Karim Younes',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Text(
                    '08:39 AM',
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              )
            ],
          ),
          verticalBox(8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fringilla natoque id',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          verticalBox(12),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(
              Assets.eventPicture,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          verticalBox(12),
          Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    Assets.heart,
                    height: 22.w,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  horizontalBox(8),
                  Image.asset(
                    Assets.comment,
                    height: 24.w,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  horizontalBox(8),
                  Image.asset(Assets.repost, height: 24.w),
                  horizontalBox(8),
                  Image.asset(Assets.sharePost, height: 24.w),
                ],
              ),
              const Spacer(),
              Image.asset(Assets.bookMark, height: 22.w),
            ],
          )
        ],
      ),
    );
  }
}
