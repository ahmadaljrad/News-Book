import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_book/shared/styles/colors.dart';
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
              title: LangHelper.getLangHelper(LangHelper.title),
            ),
            body: Stack(
              children: [
                Container(
                  child: AppCubit.get(context)
                      .screens[AppCubit.get(context).currentIndex],
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  left: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          right: 25.0, left: 25.0, bottom: 6.0, top: 6.0),
                      decoration: BoxDecoration(
                        color: kBasicColor.withAlpha(200),
                        borderRadius: BorderRadius.circular(75.0),
                      ),
                      child: DotNavigationBar(
                        currentIndex: AppCubit.get(context).currentIndex,
                        onTap: (index) {
                          AppCubit.get(context)
                              .changeBottomNavigationBarItem(index);
                        },
                        borderRadius: 50.0,
                        // dotIndicatorColor: Colors.black,
                        items: AppCubit.get(context).items,
                        itemPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 7),
                        backgroundColor: Colors.transparent,
                        unselectedItemColor: kWhiteColor.withOpacity(0.8),
                        enableFloatingNavBar: false,
                        //marginR: const EdgeInsets.all(2.0),
                        // paddingR: const EdgeInsets.all(15.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
