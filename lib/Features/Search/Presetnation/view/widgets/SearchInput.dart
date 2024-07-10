import '../../../../../Core/index.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (value) {},
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
      decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(
            minHeight: 24.r,
            maxHeight: 24.r,
          ),
          prefixIconConstraints: BoxConstraints(
            minHeight: 27.r,
            maxHeight: 27.r,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              Assets.search,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: onTap,
              child: Image.asset(
                Assets.settings,
              ),
            ),
          ),
          hintText: 'rechercher un article...',
          hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.w700),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:const BorderSide(
                color: Colors.transparent,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          filled: true,
          fillColor:
              Theme.of(context).colorScheme.onSecondary.withOpacity(0.41),
          contentPadding: const EdgeInsets.all(16)),
    );
  }
}
