import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_book/modules/newsApp/saved/saved_screen.dart';
import 'package:hive/hive.dart';
import 'package:news_book/shared/index/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../modules/newsApp/business/business_screen.dart';
import '../../../modules/newsApp/profile/profile_screen.dart';
import '../../../modules/newsApp/science/science_screen.dart';
import '../../../modules/newsApp/search/search_screen.dart';
import '../../../modules/newsApp/sports/sports_screen.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = Hive.box('AppSettings').get('isDark') ?? false;
  void changeThemeMode() async {
    var box = Hive.box('AppSettings');
    isDark = !isDark;
    box.put('isDark', isDark);
    //await box.close();
    emit(AppChangeThemeModeState());
  }

  List<DotNavigationBarItem> items = [
    /// Home
    DotNavigationBarItem(
      icon: const Icon(Icons.business_center_rounded),
      selectedColor: Colors.purple,
    ),
    DotNavigationBarItem(
      icon: const Icon(FontAwesomeIcons.footballBall),
      selectedColor: Colors.blue,
    ),
    DotNavigationBarItem(
      icon: const Icon(Icons.science),
      selectedColor: Colors.lime,
    ),

    /// Likes
    DotNavigationBarItem(
      icon: const Icon(Icons.bookmark_border),
      selectedColor: Colors.pink,
    ),

    /// Search
    DotNavigationBarItem(
      icon: const Icon(Icons.search),
      selectedColor: Colors.orange,
    ),

    /// Profile
    DotNavigationBarItem(
      icon: const Icon(Icons.person),
      selectedColor: Colors.teal,
    ),
  ];
  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SavedScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  void changeBottomNavigationBarItem(index) {
    currentIndex = index;
    emit(AppChangeBottomNavigationBarItemState());
  }

  List<dynamic> selectedCategory = [Category.choises[0]];
  void addSelectedCategory(values) {
    selectedCategory = values;
    emit(AppAddMultiSelectChipDisplayState());
  }

/*
  void removeSelectedCategory(value) {
    selectedCategory.remove(value);
    emit(AppRemoveMultiSelectChipDisplayState());
  }
*/

}
