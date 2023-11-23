import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const secondaryColor=Color.fromARGB(255, 97, 124, 145);
const primaryClr=Color.fromARGB(255,224,225,221);
const indicatorColor=Color.fromARGB(255, 184, 198, 208);
const grey=Color.fromARGB(255, 76, 75, 75);
const transitionDuration=Duration(milliseconds: 250);



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


//}
  TextStyle get headingStyle{
    return GoogleFonts.poppins(
      textStyle:  const TextStyle
                (fontSize: 24,
                fontWeight: FontWeight.bold,
                ),
    );
  }
    TextStyle get subheadingStyle{
    return GoogleFonts.poppins(
      textStyle:  const TextStyle
                (fontSize: 16,
                fontWeight: FontWeight.w600,
                ),
    );
  }
    TextStyle get buttonTitleStyle{
    return GoogleFonts.yesevaOne(
      textStyle:  const TextStyle
                (fontSize: 22,
                // fontWeight: FontWeight.bold,
                
    ));
  }
  //   TextStyle get subtitleStyle{
  //   return GoogleFonts.lato(
  //     textStyle:  TextStyle
  //               (fontSize: 16,
  //               fontWeight: FontWeight.bold,
  //               color:Get.isDarkMode?Colors.white:darkGreyClr),
  //   );
  // }
  // TextStyle get bodyStyle{
  //   return GoogleFonts.lato(
  //     textStyle:  TextStyle
  //               (fontSize: 24,
  //               fontWeight: FontWeight.bold,
  //               color:Get.isDarkMode?Colors.white:darkGreyClr),
  //   );
  // }
  //   TextStyle get body2Style{
  //   return GoogleFonts.lato(
  //     textStyle:  TextStyle
  //               (fontSize: 14,
  //               fontWeight: FontWeight.w400,
  //               color:Get.isDarkMode?Colors.grey[300]:darkGreyClr),
  //   );
  }