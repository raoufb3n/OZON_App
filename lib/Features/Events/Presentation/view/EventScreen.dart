import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstarter/Core/Helper/CustomBox.dart';
import 'package:flutterstarter/Features/Events/Presentation/view/widgets/eEventShimmerWidget.dart';
import 'package:flutterstarter/Features/Events/Presentation/viewModel/cubit/event_cubit.dart';
import 'package:flutterstarter/Features/Home/presentation/view/widgets/EventCard.dart';

class EventsScren extends StatelessWidget {
  const EventsScren({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Évènements à venir',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            verticalBox(12),
            /*const EventCard(),*/
            verticalBox(24),
            Text(
              'Évènements similaires',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            verticalBox(12),
            BlocBuilder<EventCubit, EventState>(
              builder: (context, state) {
                return state.when(initial: () {
                  return SizedBox.shrink();
                }, loading: () {
                  return Eeventshimmerwidget();
                }, loaded: (event) {
                  return EventCard(
                    title: event.data!.name!,
                    participants:event.data!.participations! ,
                    start: event.data!.start!,
                  );
                }, error: (message) {
                  return Eeventshimmerwidget();
                });
              },
            ),
            verticalBox(24),
            Text(
              'Évènements disponibles',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            verticalBox(12),
            /*const EventCard(),*/
          ],
        ),
      ),
    );
  }
}
