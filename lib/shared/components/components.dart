import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_book/modules/web_view/web_view.dart';
import 'package:news_book/shared/styles/colors.dart';
import 'package:news_book/shared/styles/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import '../bloc/cubit/app_cubit.dart';
import '../bloc/newsAppCubit/news_app_cubit.dart';
import 'package:toast/toast.dart';

void showSuccessMsg({required context, required text}) {
  ToastContext().init(context);
  Toast.show(
    text,
    duration: Toast.lengthLong,
    gravity: Toast.bottom,
    backgroundColor: kGreenColor,
    webTexColor: kWhiteColor,
  );
}

void showWarningMsg({required context, required text}) {
  ToastContext().init(context);
  Toast.show(
    text,
    duration: Toast.lengthLong,
    gravity: Toast.bottom,
    backgroundColor: Colors.amber,
    webTexColor: Colors.black,
  );
}

void showErrorMsg({required context, required text}) {
  ToastContext().init(context);
  Toast.show(
    text,
    duration: Toast.lengthLong,
    gravity: Toast.bottom,
    backgroundColor: kRedColor,
    webTexColor: kWhiteColor,
  );
}

void navigatorpushWithFinish({
  required context,
  required nextPage,
}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => nextPage),
    (Route<dynamic> route) => false,
  );
}

void navigatorpushWithoutFinish({
  required context,
  required nextPage,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => nextPage),
  );
}

Widget buildLogoText({required String text}) {
  return Center(
    child: Container(
      height: 245,
      width: 400,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff008FFF),
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget buildSubmitButton({required onPressed, isLoading = false}) {
  return GestureDetector(
    onTap: () {
      onPressed();
    },
    child: isLoading
        ? Container(
            margin: const EdgeInsets.only(top: 20, bottom: 75.0),
            child: const CircularProgressIndicator(),
          )
        : Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20, bottom: 50),
            decoration: const BoxDecoration(
                color: Color(0xff008FFF),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x60008FFF),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                    spreadRadius: 0,
                  ),
                ]),
            padding: const EdgeInsets.all(20.0),
            child: const Center(
                child: Text(
              "Submit",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: kWhiteColor,
              ),
            )),
          ),
  );
}

Widget buildRegisterButton({required onTap}) {
  return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Center(
          child: RichText(
        text: TextSpan(
          text: "Dont have an account? ",
          style: const TextStyle(
            color: kBlackColor,
            fontSize: 15,
          ),
          children: [
            TextSpan(
                text: " Register here",
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap = onTap),
          ],
        ),
      )));
}

Widget buildResetPasswordButton({required onTap}) {
  return Container(
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      child: Center(
          child: RichText(
        text: TextSpan(
          text: "Forget your password? ",
          style: const TextStyle(
            color: kBlackColor,
            fontSize: 15,
          ),
          children: [
            TextSpan(
                text: " Reset here",
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap = onTap),
          ],
        ),
      )));
}

Widget buildInputField({
  required prefixIcon,
  required controller,
  required hintText,
  bool isObscure = false,
  onChangeObscure,
}) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 25,
          offset: Offset(0, 5),
          spreadRadius: -25,
        ),
      ],
    ),
    margin: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      controller: controller,
      obscureText: isObscure,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xff000912),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xffA6B0BD),
        ),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: onChangeObscure != null
            ? IconButton(
                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: onChangeObscure)
            : null,
        prefixIcon: Icon(prefixIcon),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 75,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    ),
  );
}

AppBar buildAppBar({
  required BuildContext context,
  required String title,
}) {
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.brightness_4_outlined,
        ),
        onPressed: () {
          AppCubit.get(context).changeThemeMode();
        },
      ),
    ],
  );
}

Widget buildCustomSearchBar(
    {required context, required isDark, required color}) {
  return Padding(
    padding:
        const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 8.0, right: 8.0),
    child: Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: TextFormField(
              onChanged: (value) async {
                await Future.delayed(const Duration(milliseconds: 500), () {
                  // Do something
                  NewsAppCubit.get(context).searchForPosts(value);
                });
              },
              style: isDark ? authorTextStyleDark : authorTextStyleLight,
              decoration: InputDecoration(
                hintText: "search",
                hintStyle: TextStyle(
                  color: isDark ? kWhiteColor.withAlpha(50) : kGreyColor,
                  fontSize: 18.0,
                ),
                border: InputBorder.none,
                suffixIcon: Icon(
                  FontAwesomeIcons.searchengin,
                  color: isDark ? kWhiteColor : kBlackColor,
                ),
                //labelText: 'Enter your username',
              ),
              cursorColor: color,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildArticleItem({
  required dynamic article,
  required BuildContext context,
  int index = 0,
}) {
  bool isDark = context.watch<AppCubit>().isDark;
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewPage(
                    url: "${article['url']}",
                  )));
    },
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDark ? kItemDarkColor : kItemLightColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 75,
              width: 75,
              child: buildNetworkImage(
                article: article,
                isDark: isDark,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "${article['title']}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            isDark ? authorTextStyleDark : authorTextStyleLight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Image buildNetworkImage({article, isDark}) {
  return Image.network(
    "${article['urlToImage']}",
    errorBuilder: (context, error, stackTrace) {
      return Container(); /*Icon(
        Icons.image_not_supported_sharp,
        color: isDark ? kWhiteColor : kBlackColor,
      );*/
    },
    fit: BoxFit.cover,
  );
}

Widget buildListOfItems({required listArticle, context}) {
  return listArticle.isNotEmpty
      ? ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: listArticle.length,
          itemBuilder: ((context, index) => buildSlidable(
                child: buildArticleItem(
                    //when we want to show reverse list we will use => (listArticle.length - 1) - index
                    article: listArticle[(listArticle.length - 1) - index],
                    context: context),
                func: (context) {
                  NewsAppCubit.get(context)
                      .savePost(listArticle[(listArticle.length - 1) - index]);
                },
              )),
        )
      : const Center(
          child: Text(
            "No Save Posts",
            style: TextStyle(
              color: kGreyColor,
              fontSize: 16.0,
            ),
          ),
        );
}

Slidable buildSlidable({required child, required func}) {
  return Slidable(
    key: const ValueKey(0),
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: func,
          backgroundColor: kRedColor,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
    child: child,
  );
}

Widget buildCustomHero({
  required String urlToImage,
  required VoidCallback onTap,
}) {
  return SizedBox(
    child: Hero(
      tag: urlToImage,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Image.network(
            urlToImage,
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: CircularProgressIndicator());
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

//build list of posts
Widget buildListOfPosts(
    {required listArticle, required context, bool isDark = true}) {
  return listArticle.isNotEmpty
      ? ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: listArticle.length,
          itemBuilder: ((context, index) => buildPost(
                article: listArticle[index],
                isDark: isDark,
                context: context,
              )),
        )
      : const Center(
          child: CircularProgressIndicator(),
        );
}

/*
build post :
        buildPost ->
         [
        buildHeaderOfPost,
        buildTitleOfPost,
        buildImageForPost,
        buildCustomDivider,
        buildFooterOfPost-> [buildCustomButton]
         ]
*/

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

Widget buildPost({isDark, required context, required article}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Card(
      color: isDark ? kItemDarkColor : kItemLightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildHeaderOfPost(
            context: context,
            isDark: isDark,
            article: article,
          ),
          buildTitleOfPost(
            isDark: isDark,
            article: article,
          ),
          //buildNetworkImage(article, isDark),
          buildImageForPost(
            article: article,
            isDark: isDark,
          ),

          buildFooterOfPost(
            context: context,
            article: article,
            isDark: isDark,
          ),
        ],
      ),
    ),
  );
}

Widget buildHeaderOfPost({required context, isDark, article}) {
  //bool isSaved = NewsAppCubit.get(context).savePost(article);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text(
                "${article['source']['name']}"[0],
                style: isDark ? authorTextStyleDark : authorTextStyleLight,
              ),
              backgroundColor: Color(Random().nextInt(0xffffffff)),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${article['source']['name']}",
                style: isDark ? authorTextStyleDark : authorTextStyleLight,
              ),
              Text(
                "${article['publishedAt']}",
                style: isDark ? subtitleTextStyleDark : subtitleTextStyleLight,
              )
            ],
          ),
        ],
      ),
      //

      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                NewsAppCubit.get(context).isSaved(article)
                    ? Icons.bookmark
                    : Icons.bookmark_border,
                color: NewsAppCubit.get(context).isSaved(article)
                    ? Colors.teal
                    : (isDark ? kWhiteColor : kBlackColor),
              ),
              onPressed: () {
                NewsAppCubit.get(context).savePost(article);
              },
            ),
            IconButton(
              icon: FaIcon(
                Icons.close,
                color: isDark ? kWhiteColor : kBlackColor,
              ),
              onPressed: () {
                //AppCubit.get(context).changeThemeMode();
              },
            ),
          ],
        ),
      )
    ],
  );
}

Widget buildTitleOfPost({isDark, article}) {
  //If you need to match any string that cannot contain any non-English letter use
  RegExp exp = RegExp(r'^(?:[a-zA-Z]|\P{L})+$', unicode: true);

  return Padding(
    padding:
        const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0, bottom: 8.0),
    child: Text(
      "${article['title']}",
      textDirection: exp.hasMatch("${article['title']}")
          ? TextDirection.ltr
          : TextDirection.rtl,
      //maxLines: 2,
      //overflow: TextOverflow.ellipsis,
      style: isDark ? subjectTextStyleDark : subjectTextStyleLight,
    ),
  );
}

Widget buildImageForPost({article, isDark}) {
  return SizedBox(
      //color: kGreenDarkColor,
      //height: 200,
      //width: double.infinity,
      child: Center(
    child: buildNetworkImage(
      article: article,
      isDark: isDark,
    ),
  ));
}

Widget buildCustomDivider() {
  return const Padding(
    padding: EdgeInsets.only(left: 8.0, right: 8.0),
    child: Divider(
      color: Colors.grey,
      thickness: 2.0,
    ),
  );
}

Widget buildFooterOfPost({context, article, isDark}) {
  return Column(
    children: [
      buildRowBefoerDivider(article, isDark, context),
      buildCustomDivider(),
      buildRowAfterDivider(article, isDark, context),
    ],
  );
}

Row buildRowBefoerDivider(article, isDark, context) {
  int numberOfLikes = 0;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 15.0,
                child: Icon(
                  FontAwesomeIcons.thumbsUp,
                  size: 15.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(numberOfLikes.toString(),
                  style: isDark ? authorTextStyleDark : authorTextStyleLight),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, right: 1.0, left: 8.0),
              child: Text(
                "15",
                style: isDark ? authorTextStyleDark : authorTextStyleLight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
              child: Text(
                " comments",
                style: isDark ? authorTextStyleDark : authorTextStyleLight,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Row buildRowAfterDivider(article, isDark, context) {
  bool isLike = NewsAppCubit.get(context).isLike(getPostId(article['url']));
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text(
                "${article['source']['name']}"[0],
                style: isDark ? authorTextStyleDark : authorTextStyleLight,
              ),
              backgroundColor: Color(Random().nextInt(0xffffffff)),
              radius: 16.0,
            ),
          ),
          Text(
            "write a comment",
            style: captionTextStyle,
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                isLike ? Icons.thumb_up : Icons.thumb_up_outlined,
                color:
                    isLike ? kBlueColor : (isDark ? kWhiteColor : kBlackColor),
                size: 25.0,
              ),
              onPressed: () {
                NewsAppCubit.get(context)
                    .setLikeToPost(getPostId(article['url']));
                /*if (isLike != null && !isLike) {
                  NewsAppCubit.get(context)
                      .setLikeToPost(getPostId(article['url']));
                } else if (isLike != null && isLike) {
                  NewsAppCubit.get(context)
                      .resetLikeToPost(getPostId(article['url']));
                }*/
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.share,
                color: isDark ? kWhiteColor : kBlackColor,
              ),
              onPressed: () {
                //AppCubit.get(context).changeThemeMode();
              },
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildCustomButton({title, icon, color, isDark, onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(width: 2.0),
        Text(
          title,
          style: isDark ? authorTextStyleDark : authorTextStyleLight,
        ),
      ],
    ),
  );
}

Widget buildCustomMultiSelectBottomSheetField<T>({
  required IconData buttonIcon,
  required List<MultiSelectItem<T>> items,
  required BuildContext context,
}) {
  final isDark = AppCubit.get(context).isDark;
  final titleTextStyle = isDark ? authorTextStyleDark : authorTextStyleLight;
  final colorStyle = isDark ? kWhiteColor : kBlackColor;
  final title = T.toString();
  return MultiSelectBottomSheetField(
    decoration: decorationPrimaries,
    initialChildSize: 0.4,
    listType: MultiSelectListType.CHIP,
    searchable: true,
    searchIcon: Icon(
      FontAwesomeIcons.searchengin,
      color: colorStyle,
    ),
    searchHintStyle: TextStyle(
      color: colorStyle,
    ),
    closeSearchIcon: Icon(
      Icons.close,
      color: colorStyle,
    ),
    backgroundColor: isDark ? kAppBarDarkColor : kAppBarLightColor,
    buttonText: Text(
      title,
      style: titleTextStyle,
    ),
    buttonIcon: Icon(
      buttonIcon,
      color: colorStyle,
    ),
    title: Text(
      title,
      style: titleTextStyle,
    ),
    //selectedItemsTextStyle: titleTextStye,
    //itemsTextStyle: subtitleTextStye,
    items: items,
    onConfirm: (values) {
      AppCubit.get(context).addSelectedCategory(values);
    },
    chipDisplay: MultiSelectChipDisplay(
      textStyle: subtitleTextStyleLight,
      /*icon: const Icon(FontAwesomeIcons.xmark),
      onTap: (value) {
        AppCubit.get(context).removeSelectedCategory(value);
      },*/
    ),
  );
}
