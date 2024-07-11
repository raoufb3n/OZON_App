import 'package:flutterstarter/Features/Auth/presentation/view/LoginScreen.dart';

import '../../../../Core/index.dart';
import 'widgets/CustomBottomSheet.dart';
import 'widgets/DateCustomWidget.dart';
import 'widgets/NumericAvatar.dart';

class Eventdetailsscreen extends StatefulWidget {
  const Eventdetailsscreen({super.key});

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
          onPressed: () {},
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
              child: Stack(
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
                      Image.asset(
                        Assets.eventPicture,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        Assets.eventPicture,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        Assets.eventPicture,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 8,
                    right: 150,
                    left: 150,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: index,
                      decorator: DotsDecorator(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.35),
                        activeColor: Theme.of(context).colorScheme.onPrimary,
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            verticalBox(16),
            Text(
              'Plantation d’arbres pour créer une forêt',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            verticalBox(12),
            const DateCustomWidget(),
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
              child: CustomButton(
                title: 'Prendre une place',
                onPressed: () {},
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
