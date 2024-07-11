import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstarter/Core/index.dart';
import 'package:flutterstarter/Features/Events/Presentation/view/EventScreen.dart';
import 'package:flutterstarter/Features/Home/presentation/view/HomeScreen.dart';
import 'package:flutterstarter/Features/Search/Presetnation/view/SearchScreen.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  List<Widget> pages =const [Homescreen(), SearchScreen(), EventsScren()];
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeLayout(int index) {
    currentIndex = index;
    emit(ChangeLayout());
  }
}
