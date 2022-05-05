import 'package:flutter/material.dart';
import 'package:flutter_app/shared/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

var sourceNameTextStyeDark = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
  color: kWhiteColor,
);

var sourceNameTextStyeLight = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
  color: kBlackColor,
);

var descriptionTextStyeDark = const TextStyle(
  //fontWeight: FontWeight.w400,
  fontSize: 16.0,
  color: kWhiteColor,
);

var descriptionTextStyeLight = const TextStyle(
  //fontWeight: FontWeight.w400,
  fontSize: 16.0,
  color: kBlackColor,
);

var authorTextStyleDark = GoogleFonts.montserrat(
  fontSize: 13.0,
  color: kWhiteColor,
  height: 1.6,
);

var authorTextStyleLight = GoogleFonts.montserrat(
  fontSize: 13.0,
  color: kBlackColor,
  height: 1.6,
);

var subjectTextStyleDark = GoogleFonts.montserrat(
  fontSize: 14.0,
  fontWeight: FontWeight.w600,
  color: kWhiteColor,
  height: 1.6,
);

var subjectTextStyleLight = GoogleFonts.montserrat(
  fontSize: 14.0,
  fontWeight: FontWeight.w600,
  color: kBlackColor,
  height: 1.6,
);

var subtitleTextStyleDark = const TextStyle(
  color: kWhiteColor,
  fontSize: 10.0,
);

var subtitleTextStyleLight = const TextStyle(
  color: kBlackColor,
  fontSize: 10.0,
);

var captionTextStyle = const TextStyle(
  color: kGreyColor,
  fontSize: 13.0,
  fontWeight: FontWeight.w600,
);

var numberOfLikesStyle = const TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
);

var numberOfCommentsStyle = const TextStyle(
  color: Colors.cyan,
  fontWeight: FontWeight.bold,
);

var decorationPrimaries = BoxDecoration(
  color: Colors.primaries[5].withOpacity(0.1),
  borderRadius: const BorderRadius.all(Radius.circular(40)),
  border: Border.all(
    color: Colors.primaries[5],
    width: 2,
  ),
);

var decorationAmber = BoxDecoration(
  color: Colors.amber.withOpacity(0.1),
  borderRadius: const BorderRadius.all(Radius.circular(40)),
  border: Border.all(
    color: Colors.amber,
    width: 2,
  ),
);
