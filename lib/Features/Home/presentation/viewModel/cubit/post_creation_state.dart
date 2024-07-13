part of 'post_creation_cubit.dart';

abstract class PostCreationState{}
class PostCreationInitial extends PostCreationState {
}
class PostCreationLoading extends PostCreationState {
 
}
class PostCreationLoaded extends PostCreationState {
  
}
class PostCreationFailed extends PostCreationState {
  final String message;
  PostCreationFailed(this.message);
}
