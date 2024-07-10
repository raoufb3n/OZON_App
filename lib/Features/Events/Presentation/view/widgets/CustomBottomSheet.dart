




import '../../../../../Core/index.dart';
import 'SocialLinkItem.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.smInfo,
  });

  final Map<String, List<String>> smInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Partager à',
                style:
                    Theme.of(context).textTheme.titleMedium,
              ),
              verticalBox(12),
              SizedBox(
                height: 80.h,
                width: context.screenWidth,
                child: Align(
                  alignment: Alignment.center,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      for (int i = 0;
                          i < smInfo['smNames']!.length;
                          i++)
                        SocialLinkItem(
                          smName: smInfo['smNames']![i],
                          imgPath: smInfo['smImgPath']![i],
                          onTap: () {
                            SocialShare.shareWhatsapp("Hello World");
                          },
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
  }
}


