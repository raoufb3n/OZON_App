import 'package:flutter/material.dart';
import 'package:flutterstarter/Core/index.dart';
import 'package:flutterstarter/Features/Search/Presetnation/view/widgets/SearchInput.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: CircleAvatar(
                radius: 28,
                backgroundColor:
                    Theme.of(context).colorScheme.onSecondary.withOpacity(0.35),
                child: Image.asset(
                  Assets.close,
                  height: 24,
                )),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            'Rechercher',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchInput(
                onTap: () {},
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Filtres',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      children: [
                        CustomCheckBox(
                          title: 'Articles',
                        ),
                        CustomCheckBox(
                          title: 'Évènements',
                        ),
                        CustomCheckBox(
                          title: 'Posts',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SearchHistoryItem()
            ],
          ),
        ));
  }
}

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            checkColor: Theme.of(context).colorScheme.onPrimary,
            value: isChecked,
            onChanged: (v) {
              setState(() {
                isChecked = v!;
              });
            },
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            activeColor: Theme.of(context).colorScheme.primary,
          ),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}

class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              Assets.clock,
              height: 24.h,
            ),
            horizontalBox(8),
            Text(
              'Projets de nettoyage des rivières et des plages',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              maxLines: 3,
              overflow: TextOverflow.fade,
            ),
          ],
        ),
        verticalBox(12),
        Divider(
          color: Theme.of(context).colorScheme.onSecondary,
          height: 2,
        ),
      ],
    );
  }
}
