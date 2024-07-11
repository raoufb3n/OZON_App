import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstarter/Core/index.dart';
import 'package:flutterstarter/Core/ui/Animation.dart';
import 'package:flutterstarter/Features/Events/Presentation/view/EventDetailsScreen.dart';
import 'package:flutterstarter/Features/Events/Presentation/view/widgets/eEventShimmerWidget.dart';
import 'package:flutterstarter/Features/Events/Presentation/viewModel/cubit/event_cubit.dart';
import 'package:flutterstarter/Features/Home/presentation/view/widgets/EventCard.dart';

class EventsScren extends StatelessWidget {
  EventsScren({super.key});
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Évènements',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () => context.read<EventCubit>().getEvents(),
        color: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        strokeWidth: 4.0,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: BlocListener<EventCubit, EventState>(
              listener: (context, state) {
                state.whenOrNull(
                  error: (message) {},
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Évènements à venir',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  verticalBox(12),
                  BlocBuilder<EventCubit, EventState>(
                    builder: (context, state) {
                      return state.when(initial: () {
                        return const SizedBox.shrink();
                      }, loading: () {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: const Eeventshimmerwidget(),
                        );
                      }, loaded: (event) {
                        return EventCard(
                            title: event[2].name!,
                            participants: event[2].participations!,
                            start: event[2].start!,
                            image: event[2].images!,
                            onTap: () => context.push(FadeSlidePageTransition(
                                    page: Eventdetailsscreen(
                                  model: event[2],
                                ))));
                      }, error: (message) {
                        return Text(message);
                      });
                    },
                  ),
                  verticalBox(24),
                  Text(
                    'Évènements similaires',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  verticalBox(12),
                  BlocBuilder<EventCubit, EventState>(
                    builder: (context, state) {
                      return state.when(initial: () {
                        return SizedBox.shrink();
                      }, loading: () {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: const Eeventshimmerwidget(),
                        );
                      }, loaded: (event) {
                        return EventCard(
                            title: event[1].name!,
                            participants: event[1].participations!,
                            start: event[1].start!,
                            image: event[1].images!,
                            onTap: () => context.push(FadeSlidePageTransition(
                                    page: Eventdetailsscreen(
                                  model: event[2],
                                ))));
                      }, error: (message) {
                        return Text(message);
                      });
                    },
                  ),
                  verticalBox(24),
                  Text(
                    'Évènements disponibles',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  verticalBox(12),
                  BlocBuilder<EventCubit, EventState>(
                    builder: (context, state) {
                      return state.when(initial: () {
                        context.read<EventCubit>().getEvents();
                        return SizedBox.shrink();
                      }, loading: () {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return const Eeventshimmerwidget();
                            });
                      }, loaded: (event) {
                        return ListView.builder(
                            itemCount: event.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return EventCard(
                                  title: event[index].name!,
                                  participants: event[index].participations!,
                                  start: event[index].start!,
                                  image: event[index].images!,
                                  onTap: () =>
                                      context.push(FadeSlidePageTransition(
                                          page: Eventdetailsscreen(
                                        model: event[index],
                                      ))));
                            });
                      }, error: (message) {
                        return Text(message);
                      });
                    },
                  ),
                  /*const EventCard(),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
