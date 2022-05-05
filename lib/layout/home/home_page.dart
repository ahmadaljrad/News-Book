import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/bloc/cubit/app_cubit.dart';
import '../../shared/bloc/cubit/app_states.dart';
import '../../shared/components/components.dart';
import '../../shared/lang/lang_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: buildAppBar(
              context: context,
              title: LangHelper.getLangHelper(LangHelper.newsApp),
            ),
            body: Container(
              child: AppCubit.get(context)
                  .screens[AppCubit.get(context).currentIndex],
            ),
            bottomNavigationBar: DotNavigationBar(
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (index) {
                AppCubit.get(context).changeBottomNavigationBarItem(index);
              },
              // dotIndicatorColor: Colors.black,
              items: AppCubit.get(context).items,
              backgroundColor: Colors.transparent,
              unselectedItemColor:
                  AppCubit.get(context).isDark ? kWhiteColor : kBlackColor,
              enableFloatingNavBar: false,
              //marginR: const EdgeInsets.all(2.0),
              paddingR: const EdgeInsets.all(3.0),
            ),
          );
        });
  }
}
