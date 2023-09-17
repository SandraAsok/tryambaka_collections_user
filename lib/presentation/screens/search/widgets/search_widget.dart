import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryambaka_user/core/color/colors.dart';

class CustomSearchWidget extends StatelessWidget {
  //final void Function(String query) onChanged;
  const CustomSearchWidget({
    Key? key,
    //required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      borderRadius: BorderRadius.circular(30),
      backgroundColor: grey.withOpacity(0.4),
      prefixIcon: const Icon(
        CupertinoIcons.search,
        color: grey,
      ),
      suffixIcon: const Icon(
        CupertinoIcons.xmark_circle_fill,
        color: grey,
      ),
      style: const TextStyle(color: black),
      placeholder: "Search what you want to wear",
      placeholderStyle: GoogleFonts.luxuriousRoman(
          fontSize: 15, color: grey, fontWeight: FontWeight.bold),
    );
  }
}
