abstract class NewsAppStates {}

class NewsAppInitState extends NewsAppStates {}

class NewsAppBusinessLoadingState extends NewsAppStates {}

class NewsAppBusinessSuccessState extends NewsAppStates {}

class NewsAppBusinessErrorState extends NewsAppStates {
  final String error;

  NewsAppBusinessErrorState(this.error);
}

class NewsAppSportsLoadingState extends NewsAppStates {}

class NewsAppSportsSuccessState extends NewsAppStates {}

class NewsAppSportsErrorState extends NewsAppStates {
  final String error;

  NewsAppSportsErrorState(this.error);
}

class NewsAppScienceLoadingState extends NewsAppStates {}

class NewsAppScienceSuccessState extends NewsAppStates {}

class NewsAppScienceErrorState extends NewsAppStates {
  final String error;

  NewsAppScienceErrorState(this.error);
}

class NewsAppSetOrRestSavedState extends NewsAppStates {}

class NewsAppSavedLoadingState extends NewsAppStates {}

class NewsAppSavedSuccessState extends NewsAppStates {}

class NewsAppSavedErrorState extends NewsAppStates {
  final String error;

  NewsAppSavedErrorState(this.error);
}

class NewsAppLikesLoadingState extends NewsAppStates {}

class NewsAppLikesSuccessState extends NewsAppStates {}

class NewsAppSetLikesLoadingState extends NewsAppStates {}

class NewsAppSetLikesSuccessState extends NewsAppStates {}

class NewsAppReSetLikesLoadingState extends NewsAppStates {}

class NewsAppReSetLikesSuccessState extends NewsAppStates {}

class NewsAppNumberOfLikesLoadingState extends NewsAppStates {}

class NewsAppNumberOfLikesSuccessState extends NewsAppStates {}

class NewsAppNumberOfLikesErrorState extends NewsAppStates {
  final String error;

  NewsAppNumberOfLikesErrorState(this.error);
}

class NewsAppCommentsLoadingState extends NewsAppStates {}

class NewsAppCommentsSuccessState extends NewsAppStates {}

class NewsAppCommentsErrorState extends NewsAppStates {
  final String error;

  NewsAppCommentsErrorState(this.error);
}

class NewsAppProfileLoadingState extends NewsAppStates {}

class NewsAppProfileSuccessState extends NewsAppStates {}

class NewsAppProfileErrorState extends NewsAppStates {
  final String error;

  NewsAppProfileErrorState(this.error);
}

class NewsAppSearchState extends NewsAppStates {}
