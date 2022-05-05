import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/bloc/cubit/app_cubit.dart';
import '../../../shared/bloc/newsAppCubit/news_app_cubit.dart';
import '../../../shared/bloc/newsAppCubit/news_app_states.dart';
import '../../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {
      if (state is NewsAppLikesLoadingState) {
        NewsAppCubit.get(context).numberOfLikes();
      }
    }, builder: (context, state) {
      return buildListOfPosts(
        context: context,
        listArticle: NewsAppCubit.get(context).business,
        isDark: context.watch<AppCubit>().isDark,
      );
    });
  }
}
