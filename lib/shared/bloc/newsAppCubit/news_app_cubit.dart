import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/user_like.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../network/remote/dio_helper.dart';
import 'news_app_states.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsAppInitState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  final String _apiKey = "03cc50c59347485fa47a9bf5e66adcb7";
  final String _url = "v2/top-headlines";

  List<dynamic> business = [];
  void getBusinessData() {
    emit(NewsAppBusinessLoadingState());

    if (business.isEmpty) {
      DioHelper.getData(url: _url, querys: {
        'country': "us",
        'category': 'business',
        'apiKey': _apiKey
      }).then(
        (value) {
          business = value.data['articles'];
          emit(NewsAppBusinessSuccessState());
        },
      ).catchError((error) {
        emit(NewsAppBusinessErrorState(error));
      });
    } else {
      emit(NewsAppBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getSportsData() {
    emit(NewsAppSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(url: _url, querys: {
        'country': "eg",
        'category': 'sports',
        'apiKey': _apiKey
      }).then(
        (value) {
          sports = value.data['articles'];
          emit(NewsAppSportsSuccessState());
        },
      ).catchError((error) {
        emit(NewsAppSportsErrorState(error));
      });
    } else {
      emit(NewsAppSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScienceData() {
    emit(NewsAppScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: _url, querys: {
        'country': "us",
        'category': 'science',
        'apiKey': _apiKey
      }).then(
        (value) {
          science = value.data['articles'];
          //print(science);
          emit(NewsAppScienceSuccessState());
        },
      ).catchError((error) {
        emit(NewsAppScienceErrorState(error));
      });
    } else {
      emit(NewsAppScienceSuccessState());
    }
  }

  List<dynamic> saved = [];
  void savePost(article) {
    emit(NewsAppSavedLoadingState());
    // تم كتابة الشرط الاول ليتم حذف البوست عندما نختاره مرة ثانية وحتى يتم تغيير الايقونة
    if (saved.contains(article)) {
      saved.remove(article);
      isSaved(article);
      emit(NewsAppSavedSuccessState());
    } else {
      saved.add(article);
      isSaved(article);
      emit(NewsAppSavedSuccessState());
    }
  }

  bool isSaved(article) {
    if (saved.contains(article)) {
      return true;
    } else {
      return false;
    }
  }

  String getPostId(url) {
    var articleUrl = url.toString();
    RegExp exp = RegExp(r'^(?:[a-zA-Z]|\P{L})+$');
    String res = "";
    for (int i = 0; i < articleUrl.length; i++) {
      if (exp.hasMatch(articleUrl[i])) {
        res = res + articleUrl[i];
      }
    }
    return res;
  }

// likes is a list of postIds
  List<String> likes = [];
  void setLikeToPost(String postId) {
    emit(NewsAppLikesLoadingState());
    // تم كتابة الشرط الاول ليتم حذف البوست عندما نختاره مرة ثانية وحتى يتم تغيير الايقونة
    if (likes.contains(postId)) {
      likes.remove(postId);
      isLike(postId);
      setLike(postId, false);
    } else {
      likes.add(postId);
      isLike(postId);
      setLike(postId, true);
    }
    numberOfLikes();
  }

  bool isLike(String postId) {
    if (likes.contains(postId)) {
      return true;
    } else {
      return false;
    }
  }

  void setLike(String postId, bool isLike) {
    String uid = (FirebaseAuth.instance.currentUser!.uid).toString();
    if (isLike) {
      UserLike like = UserLike(uid: uid);
      FirebaseFirestore.instance
          .collection("posts")
          .doc(postId)
          .collection("likes")
          .doc(uid)
          .set(like.toJson());
    } else {
      FirebaseFirestore.instance
          .collection("posts")
          .doc(postId)
          .collection("likes")
          .doc(uid)
          .delete();
    }
  }

  List<dynamic> postIds = [];
  List<int> numberOflike = [];
  void numberOfLikes() {
    //String uid = FirebaseAuth.instance.currentUser!.uid;
    emit(NewsAppNumberOfLikesLoadingState());
    FirebaseFirestore.instance.collection("posts").get().then((value) {
      postIds = value.docs.toList();
      print(postIds);
      emit(NewsAppNumberOfLikesSuccessState());
    });
    /*
    for (var element in postIds) {
      FirebaseFirestore.instance
          .collection("posts")
          .doc(element)
          .collection("likes")
          .get()
          .then((value) {
        emit(NewsAppNumberOfLikesSuccessState());
        numberOflike.add(value.docs.length);
      });
      
    }*/
  }

  List<dynamic> comments = [];
  void setCommentsToPost(article) {
    emit(NewsAppSetLikesLoadingState());
    comments.add(article);
    emit(NewsAppSetLikesSuccessState());
  }

  List<dynamic> result = [];
  void searchForPosts(value) {
    List<dynamic> all = business + sports + science;
    if (all.isNotEmpty) {
      //print(all.length);
      //var a = all.map((element) => element['description'].contains(value));
      result = [];
      for (var article in all) {
        if (article['title']
            .toString()
            .toLowerCase()
            .contains(value.toString().toLowerCase())) {
          if (result.isNotEmpty && !result.contains(article)) {
            result.add(article);
          }
          if (result.isEmpty) {
            result.add(article);
          }
        }
        if (value.toString().isEmpty) {
          result = [];
        }
      }
      //print(result.length);
      emit(NewsAppSearchState());
    }
  }
}
