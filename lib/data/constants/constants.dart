import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryambaka_user/data/color/colors.dart';

TextStyle kHeading =
    const TextStyle(fontSize: 50, fontWeight: FontWeight.w100, color: white);
TextStyle normalHeading =
    const TextStyle(fontSize: 22, fontWeight: FontWeight.w100, color: white);
TextStyle itemHeading = const TextStyle(
    fontSize: 22,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    color: black);

TextStyle appbarTitle = GoogleFonts.luxuriousRoman(
    fontSize: 25, fontWeight: FontWeight.bold, color: fontcolor);

TextStyle subTitle = GoogleFonts.luxuriousRoman(
    fontSize: 18, fontWeight: FontWeight.bold, color: grey);

const kHeight100 = SizedBox(height: 100);
const kHeight150 = SizedBox(height: 150);
const kHeight50 = SizedBox(height: 50);
const kHeight25 = SizedBox(height: 25);
const kHeight10 = SizedBox(height: 10);
const kHeight5 = SizedBox(height: 5);

const kWidth25 = SizedBox(width: 25);

// ignore: unused_element
final List<String> _adImages = [
  "assets/images/saree_cover.jpeg",
  "assets/images/saree_cover2.jpeg",
  "assets/images/saree_cover.jpeg",
  "assets/images/saree_cover2.jpeg",
];
