
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstarter/Features/Home/data/domain/repo/PostRepo.dart';

import '../../../../Auth/data/domain/repos/AuthServiceRepo.dart';

part 'post_creation_state.dart';

class PostCreationCubit extends Cubit<PostCreationState> {
  PostCreationCubit() : super(PostCreationInitial());

  void createPost(String content) async{
    emit(PostCreationLoading());
    try {
       final token = await AuthServicesRepo.getToken();
       if (token != null) {
          await Postrepo().createPost(
 token, content,  [],
      1, 'post'
         );
         emit(PostCreationLoaded());
       } else {
         emit(PostCreationFailed('Token is null'));
       }
    } on Exception catch (e) {
      emit(PostCreationFailed(e.toString()));
    }
  }
}
