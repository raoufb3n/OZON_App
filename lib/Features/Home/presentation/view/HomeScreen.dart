import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstarter/Features/Home/presentation/viewModel/cubit/post_cubit.dart';
import 'package:like_button/like_button.dart';

import '../../../../Core/index.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leadingWidth: 120.w,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: Image.asset(
            Assets.logo,
          ),
        ),
        actions: [
          Image.asset(Assets.notification, height: 24.w),
          horizontalBox(16),
          Container(
              margin: const EdgeInsets.only(right: 16),
              child: Image.asset(Assets.chat, height: 24.w)),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        strokeWidth: 4.0,
        onRefresh: () {
          context.read<PostCubit>().getPosts();
          return Future<void>.value();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Évènements',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                verticalBox(16),
                /*const EventCard(),*/
                verticalBox(16),
                BlocBuilder<PostCubit, PostState>(
                  builder: (context, state) {
                    return state.maybeWhen(initial: () {
                      context.read<PostCubit>().getPosts();
                      return SizedBox();
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }, loaded: (posts) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            return PostWidget(
                              author: posts[index].author!.name!,
                              time: posts[index].createdAt.toString(),
                              content: posts[index].content!,
                              image: posts[index].images,
                              likes: posts[index].likeCount!,
                              comments: posts[index].commentsCount!,
                              reposts: posts[index].reposts!,
                              pfp: posts[index].author!.profilePic!,
                            );
                          });
                    }, error: (message) {
                      return Center(
                        child: Text(message),
                      );
                    }, orElse: () { 
                      return const SizedBox.shrink();
                     });
                  },
                ),
                verticalBox(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.author,
    required this.time,
    required this.content,
    required this.image,
    required this.likes,
    required this.comments,
    required this.reposts, required this.pfp,
  });
  final String author;
  final String time;
  final String content;
  final List<dynamic> image;
  final String pfp;
  final int likes;
  final int comments;
  final int reposts;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: pfp.isNotEmpty
                    ? NetworkImage(
                        pfp,
                      )
                    : null,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              ),
              horizontalBox(6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              )
            ],
          ),
          verticalBox(8),
          Text(
            content,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          verticalBox(12),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child:image.isNotEmpty ? Image.network(
              image[0].toString(),
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ):Image.asset(
              Assets.eventPicture,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          verticalBox(12),
          Row(
            children: [
              Row(
                children: [
                  LikeButton(
                    size: 24,
                    circleColor: CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite_outline,
                        color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                        size: 24,
                      );
                    },
                    likeCount: likes,
                    countBuilder: (int? count, bool isLiked, String text) {
                      var color =
                          isLiked ? Colors.deepPurpleAccent : Colors.grey;
                      Widget result;
                      if (count == 0) {
                        result = Text(
                          "love",
                          style: TextStyle(color: color),
                        );
                      } else
                        result = Text(
                          text,
                          style: TextStyle(color: color),
                        );
                      return result;
                    },
                  ),
                  horizontalBox(8),
                  Image.asset(
                    Assets.comment,
                    height: 24.w,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  horizontalBox(8),
                  Image.asset(Assets.repost, height: 24.w),
                  horizontalBox(8),
                  Image.asset(Assets.sharePost, height: 24.w),
                ],
              ),
              const Spacer(),
              Image.asset(Assets.bookMark, height: 22.w),
            ],
          )
        ],
      ),
    );
  }
}
