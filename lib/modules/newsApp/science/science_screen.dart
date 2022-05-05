import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/bloc/cubit/app_cubit.dart';
import '../../../shared/bloc/newsAppCubit/news_app_cubit.dart';
import '../../../shared/bloc/newsAppCubit/news_app_states.dart';
import '../../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsAppCubit, NewsAppStates>(builder: (context, state) {
      return buildListOfPosts(
        context: context,
        listArticle: NewsAppCubit.get(context).science,
        isDark: context.watch<AppCubit>().isDark,
      );
    });
  }
}
