import '../../../../../Core/index.dart';

class CustomInputTextField extends StatelessWidget {
  const CustomInputTextField({
    super.key,
    required this.label,
    required this.obsecure,
    this.onChanged,
    this.validator,
    this.inputType,
    this.controller,
    this.onSubmitted,
    this.errText,
    this.focusNode,
  });
  final String label;
  final bool obsecure;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final String? errText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        verticalBox(8),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          onFieldSubmitted: onSubmitted,
          obscureText: obsecure,
          keyboardType: inputType ?? TextInputType.text,
          onChanged: onChanged,
          validator: validator,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
          decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.error, width: 2)),
              errorText: errText,
              errorStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.w500),
              suffixIconConstraints: BoxConstraints(
                minHeight: 24.r,
                maxHeight: 24.r,
              ),
              suffixIcon: obsecure
                  ? Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Image.asset(
                        Assets.eye,
                      ),
                    )
                  : null,
              hintText: 'email@gmail.com',
              hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSecondary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSecondary)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.onPrimary,
              contentPadding: const EdgeInsets.all(16)),
        ),
      ],
    );
  }
}

class CustomSimpleInput extends StatelessWidget {
  const CustomSimpleInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
      decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(
            minHeight: 24.r,
            maxHeight: 24.r,
          ),
          hintText: 'email@gmail.com',
          hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onSecondary)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onSecondary)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          contentPadding: const EdgeInsets.all(16)),
    );
  }
}
