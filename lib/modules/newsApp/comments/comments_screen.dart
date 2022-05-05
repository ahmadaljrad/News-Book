import 'package:flutter/material.dart';
import 'package:flutter_app/shared/styles/colors.dart';

import '../../../shared/styles/styles.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color:
                    kBackgroundDarkColor, // ? kItemDarkColor : kItemLightColor,
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "{article['title']}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  authorTextStyleDark, // ? authorTextStyleDark : authorTextStyleLight,
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
        ],
      ),
    );
  }
}
