import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/bloc/cubit/app_cubit.dart';
import '../../../shared/bloc/newsAppCubit/news_app_cubit.dart';
import '../../../shared/bloc/newsAppCubit/news_app_states.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<AppCubit>().isDark;
    return BlocBuilder<NewsAppCubit, NewsAppStates>(
      builder: (context, state) {
        var res = NewsAppCubit.get(context).result;

        return Column(
          children: [
            buildCustomSearchBar(
              context: context,
              color: Colors.orange,
              isDark: context.watch<AppCubit>().isDark,
            ),
            res.isNotEmpty
                ? Expanded(
                    child: buildListOfPosts(
                      context: context,
                      listArticle: NewsAppCubit.get(context).result,
                      isDark: isDark,
                    ),
                  )
                : Expanded(
                    child: Center(
                        child: Text(
                      "No results",
                      style:
                          isDark ? authorTextStyleDark : authorTextStyleLight,
                    )),
                  )
          ],
        );
      },
    );
  }
}


// for filter data soon
/*

        var itemsCategory = Category.choises
            .map((c) => MultiSelectItem<Category>(c, c.name))
            .toList();
        var itemsCountry = Country.choises
            .map((c) => MultiSelectItem<Country>(c, c.name))
            .toList();

        return Center(
          child: SizedBox(
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120,
                  child: buildCustomMultiSelectBottomSheetField<Country>(
                    context: context,
                    items: itemsCountry,
                    buttonIcon: Icons.location_city_rounded,
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: buildCustomMultiSelectBottomSheetField<Category>(
                    context: context,
                    items: itemsCategory,
                    buttonIcon: Icons.category,
                  ),
                ),
              ],
            ),
          ),
        );

        */
