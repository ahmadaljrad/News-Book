import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:news_book/layout/login/login_page.dart';
import 'package:news_book/shared/bloc/cubit/app_cubit.dart';
import 'package:news_book/shared/components/components.dart';
import 'package:news_book/shared/styles/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String phone = "";
  late String name = "";
  late String email = "";
  getData() {
    name = FirebaseAuth.instance.currentUser!.displayName!;
    email = FirebaseAuth.instance.currentUser!.email!;
    phone = FirebaseAuth.instance.currentUser!.phoneNumber!;
  }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kBasicColor, kBasicColor.withAlpha(100)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.5, 0.9],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white70,
                minRadius: 60.0,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://scontent-mrs2-2.xx.fbcdn.net/v/t39.30808-6/292047870_2878477672453656_5623113410295111973_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=poijxiJlFUwAX96gtFp&_nc_ht=scontent-mrs2-2.xx&oh=00_AT9Ep3YLbJW4BsehKR95FKQdvsZpzgf8K22PPKbmfHUCuA&oe=633F5F61'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Ahmad Aljarad",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Top Fan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Email',
                style: TextStyle(
                  color: context.watch<AppCubit>().isDark
                      ? kWhiteColor
                      : kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "ahmadjrad8@gmail.com",
                style: TextStyle(
                  fontSize: 18,
                  color: context.watch<AppCubit>().isDark
                      ? kWhiteColor.withAlpha(150)
                      : kBlackColor.withAlpha(150),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Phone',
                style: TextStyle(
                  color: context.watch<AppCubit>().isDark
                      ? kWhiteColor
                      : kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "+963958623726",
                style: TextStyle(
                  fontSize: 18,
                  color: context.watch<AppCubit>().isDark
                      ? kWhiteColor.withAlpha(150)
                      : kBlackColor.withAlpha(150),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Hive.box('AppSettings').delete('uid').then((value) =>
                    navigatorpushWithFinish(
                        context: context, nextPage: const LoginPage()));
              },
              child: Container(
                //padding: const EdgeInsets.all(10.0),
                color: kBasicColor,
                child: const ListTile(
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
