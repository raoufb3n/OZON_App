import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/LoginScreen.dart';
import 'package:flutterstarter/Features/Events/Presentation/viewModel/cubit/partcipate_in_event_cubit.dart';
import 'package:flutterstarter/Features/Events/data/model/event/datum.dart';

import '../../../../Core/index.dart';
import 'widgets/CustomBottomSheet.dart';
import 'widgets/DateCustomWidget.dart';
import 'widgets/NumericAvatar.dart';

class Eventdetailsscreen extends StatefulWidget {
  const Eventdetailsscreen({super.key, required this.model});
  final Datum model;
  @override
  State<Eventdetailsscreen> createState() => _EventdetailsscreenState();
}

class _EventdetailsscreenState extends State<Eventdetailsscreen> {
  final PageController _pageController = PageController();
  int index = 0;
  final Map<String, List<String>> smInfo = {
    'smNames': ['Facebook', 'Instagram', 'Whatsapp', 'Telegram'],
    'smImgPath': [
      Assets.facebook,
      Assets.instagram,
      Assets.whatsapp,
      Assets.telegram,
    ]
  };

  @override
  Widget build(BuildContext context) {
    final stepperList = [
      StepperStep(
        title: SizedBox(
          width: context.screenWidth * 0.6,
          child: Text(
            'Accueil des Participants (09:00 - 09:30)',
            maxLines: 3,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w500),
          ),
        ),
        leading: const NumericAvatarWidget(num: '1'),
        view: Text(
          'Enregistrement et distribution du matériel',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
      StepperStep(
        title: SizedBox(
          width: context.screenWidth * 0.6,
          child: Text(
            'Accueil des Participants (09:00 - 09:30)',
            maxLines: 3,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w500),
          ),
        ),
        leading: const NumericAvatarWidget(num: '2'),
        view: Text(
          'Enregistrement et distribution du matériel',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: CircleAvatar(
              radius: 28,
              backgroundColor:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(0.35),
              child: Image.asset(
                Assets.arrow,
                height: 24,
              )),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          'Détails de l\'évènement',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.screenWidth,
              height: 200.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSecondary,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: widget.model.images!.isNotEmpty
                  ? Stack(
                      children: [
                        PageView(
                          controller: _pageController,
                          onPageChanged: (value) {
                            setState(() {
                              index = value;
                            });

                            _pageController.animateToPage(
                              value,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          children: [
                            for (var i = 0;
                                i < widget.model.images!.length;
                                i++)
                              Image.network(
                                widget.model.images![i],
                                fit: BoxFit.cover,
                              ),
                          ],
                        ),
                        Positioned(
                          bottom: 8,
                          right: 150,
                          left: 150,
                          child: DotsIndicator(
                            dotsCount: widget.model.images!.length,
                            position: index,
                            decorator: DotsDecorator(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.35),
                              activeColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        )
                      ],
                    )
                  : SizedBox(),
            ),
            verticalBox(16),
            Text(
              widget.model.name!,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            verticalBox(12),
            DateCustomWidget(
              date: widget.model.start!.substring(0, 10),
              time: widget.model.start!.substring(11, 18),
            ),
            verticalBox(24),
            Text(
              'Programme de l’évènement',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            verticalBox(16),
            Expanded(
              child: SingleChildScrollView(
                child: CasaVerticalStepperView(
                  physics: const BouncingScrollPhysics(),
                  steps: stepperList,
                  seperatorColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.24),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 250.w,
              child:
                  BlocBuilder<PartcipateInEventCubit, PartcipateInEventState>(
                builder: (context, state) {
                  return state.when(initial: () {
                    return CustomButton(
                      title: 'Prendre une place',
                      onPressed: () {
                        context
                            .read<PartcipateInEventCubit>()
                            .participateInEvent(widget.model.id!);
                      },
                    );
                  }, loading: () {
                    return SizedBox(
                      width: context.screenWidth,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: Theme.of(context)
                              .filledButtonTheme
                              .style!
                              .copyWith(
                                backgroundColor: WidgetStatePropertyAll(
                                    Theme.of(context).colorScheme.surface),
                              ),
                          child: CircularProgressIndicator()),
                    );
                  }, loaded: (loaded) {
                    return SizedBox(
                      width: context.screenWidth,
                      child: ElevatedButton(
                        onPressed: () {},
                        style:
                            Theme.of(context).filledButtonTheme.style!.copyWith(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Theme.of(context).colorScheme.surface),
                                ),
                        child: Text(
                          'Annuler la place',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ),
                    );
                  }, error: (message) {
                    return InkWell(
                        onTap: () {
                          context
                              .read<PartcipateInEventCubit>()
                              .participateInEvent(widget.model.id!);
                        },
                        child: Text('Try Agin'));
                  });
                },
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Image.asset(
                  Assets.share,
                  height: 24,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                horizontalBox(4),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        constraints: BoxConstraints(
                            minHeight: context.screenHeight * 0.17,
                            maxHeight: context.screenHeight * 0.19),
                        builder: (context) =>
                            CustomBottomSheet(smInfo: smInfo));
                  },
                  child: Text(
                    'Partager',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
