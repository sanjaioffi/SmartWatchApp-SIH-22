import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartwatch_application_sih/color_constants.dart';

var kHeaderStyle = TextStyle(letterSpacing: 2 ,
  fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 25,fontWeight: FontWeight.w600,color:kprimaryGreenColor,
);

var kTileHeaderStyle = TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 16,fontWeight: FontWeight.w600,color:kprimaryTextColor,
);

var kTileSelectedStyle = TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 16,fontWeight: FontWeight.w600,color:kprimaryGreenColor,
);

var kNameStyle = TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 18,fontWeight: FontWeight.w600,color:kprimaryTextColor,
);

var kValueStyle = TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 20,fontWeight: FontWeight.w600,color:kprimaryTextColor,
);

var kTileValueStyle = TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 15,fontWeight: FontWeight.w600,color:kprimaryTextColor,
);

var kTimeStyle = TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 10,fontWeight: FontWeight.w600,color:kTimeColor,
);

var kMainHeaderStyle = TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 40,fontWeight: FontWeight.w600,color:kprimaryGreenColor,
);


var kSubtitleStyle = TextStyle(fontFamily: GoogleFonts.openSans().fontFamily, fontWeight: FontWeight.w400,fontSize: 14,color: kprimaryTextColor);

var kSelectedSubtitleStyle = TextStyle(fontFamily: GoogleFonts.openSans().fontFamily, fontWeight: FontWeight.w400,fontSize: 14,color: kprimaryGreenColor);

var kButtonStyle = TextStyle(fontFamily: GoogleFonts.openSans().fontFamily, fontWeight: FontWeight.w400,fontSize: 16,color: kbuttonTextColor);


var kHintStyle = TextStyle(fontFamily: GoogleFonts.openSans().fontFamily, fontWeight: FontWeight.w600,fontSize: 16,color: ksecondaryTextColor);