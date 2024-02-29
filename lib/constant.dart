import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const secondaryColor = Color.fromARGB(255, 97, 124, 145);
const primaryClr = Color.fromARGB(255, 224, 225, 221);
const primaryClrWithOps = Color.fromARGB(0, 224, 225, 221);
const indicatorColor = Color.fromARGB(255, 184, 198, 208);
const grey = Color.fromARGB(255, 76, 75, 75);
const clrIconButton = Color.fromARGB(255, 95, 94, 94);
const transitionDuration = Duration(milliseconds: 250);
const starColor = Color.fromARGB(255, 255, 180, 5);
const containerBackground=Color.fromARGB(222, 225, 225, 225);
const borderColor=Color.fromARGB(255, 156, 155, 152);

class Themes {
//   static final light=ThemeData(
// primaryColor: primaryClr,
// // ignore: deprecated_member_use
// backgroundColor: white,
// brightness: Brightness.light,

//   );
//     static final dark=ThemeData(
// primaryColor: darkGreyClr,
// // ignore: deprecated_member_use
// backgroundColor: Get.isDarkMode?Colors.white:darkGreyClr,
// brightness: Brightness.dark,

//   );


}

TextStyle get headingStyle {
  return GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}
TextStyle get font35W700 {
  return GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w700,
    ),
  );
}


TextStyle get font16W600 {
  return GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
}
TextStyle get font17w600 {
  return GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
}
TextStyle get buttonTitleStyle {
  return GoogleFonts.yesevaOne(
      textStyle: const TextStyle(
    fontSize: 22,
    // fontWeight: FontWeight.bold,
  ));
}

TextStyle get font19w500 {
  return GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
    ),
  );
}
TextStyle get font24W600 {
  return GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
  );
}
TextStyle get bodyStyle {
  return GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w600,
    ),
  );
}

TextStyle get bodyStyle13 {
  return GoogleFonts.poppins(
    textStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 144, 144, 144)),
  );
}
TextStyle get buttonStyle22 {
  return GoogleFonts.poppins(
    textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 255, 255, 255)),
  );
}
TextStyle get font15W700ellipsis {
  return GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis
          ));
}
TextStyle get font15W700 {
  return GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          
          ));
}
TextStyle get font15W500 {
  return GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          ));
}
TextStyle get font14W600 {
  return GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          ));
}
TextStyle get inputTitleSemiBold14 {
  return GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis));
}
TextStyle get appBar20 {
  return GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis));

}
TextStyle get font13DarkBlueRegular  {
  return GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis));

}