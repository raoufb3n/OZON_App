import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstarter/Core/index.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/LoginScreen.dart';
import 'package:flutterstarter/Features/Auth/presentation/view/widget/CustomInputTextField.dart';
import 'package:flutterstarter/Features/Home/presentation/viewModel/cubit/post_cubit.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController content = TextEditingController();

  final List<String> images = [
    '',
    '',
  ];

  final int orgnizerId = 1;

  final String type = 'post';

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
                Assets.arrow,
                height: 24,
              )),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ajouter un post',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              verticalBox(8),
              CustomInputTextField(
                label: 'titre',
                obsecure: false,
                isPass: false,
              ),
              CustomInputTextField(
                label: 'Sujet',
                obsecure: false,
                isPass: false,
              ),
              CustomTextArea(
                label: 'Post',
                controller: content,
              ),
              BlocBuilder<PostCubit, PostState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () {
                      return const CircularProgressIndicator();
                    },
                    error: (message) {
                      return SizedBox(
                        width: context.screenWidth,
                        child: ElevatedButton(
                          
                          onPressed: () => context.read<PostCubit>().createPost(
                              'vfdsgfdgfdgdf', images, orgnizerId, type),
                          child: Text(
                            message,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                          ),
                        ),
                      );
                    },
                    orElse: () {
                      return CustomButton(
                          title: 'Ajouter',
                          onPressed: () {
                            context.read<PostCubit>().createPost(
                                content.text, images, orgnizerId, type);
                          });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
