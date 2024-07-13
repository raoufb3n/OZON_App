import 'package:bloc/bloc.dart';
import 'package:flutterstarter/Features/Home/data/domain/repo/PostRepo.dart';
import 'package:flutterstarter/Features/Home/data/model/post/datum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../Core/Helper/Failure.dart';
import '../../../../Auth/data/domain/repos/AuthServiceRepo.dart';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostState.initial());
  void getPosts() async {
    try {
      emit(const PostState.loading());
      final token = await AuthServicesRepo.getToken();
      if (token != null) {
        final events = await Postrepo().getPosts(token);
        emit(PostState.loaded(events!));
      } else {
        emit(PostState.error('Token is null'));
      }
    } on HandleError catch (e) {
      emit(PostState.error(HandleError.handle(e.message).message));
    } catch (e) {
      emit(PostState.error(e.toString()));
    }
  }

 
}
