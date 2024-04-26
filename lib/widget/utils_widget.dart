import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kBarlow = GoogleFonts.barlow();

class GlobalVarriable {
  static const appBarGradiant = LinearGradient(colors: [
    Color.fromARGB(255, 29, 201, 192),
    Color.fromARGB(255, 125, 221, 216),
  ], stops: [
    0.5,
    1.0
  ]);
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backGroundColor = Colors.black;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static var selectedNavBarColor = Color(0xff169315);
  static const unSelectedNavBarColor = Colors.black87;

  static List<MyListItem> items = [
    MyListItem(
      title: 'Tasbih',
      image: 'images/Note.png',
    ),
    MyListItem(
      title: 'Hadith',
      image: 'images/book-alt (1) 1.png',
    ),
    MyListItem(
      title: 'Dua',
      image: 'images/Frame 22 (3).png',
    ),
    MyListItem(
      title: 'Al-Quran',
      image: 'images/Frame 22 (2).png',
    ),
    MyListItem(
      title: 'Wallpaper',
      image: 'images/Frame 22 (1).png',
    ),
    MyListItem(
      title: 'More',
      image: 'images/Frame 22.png',
    ),
  ];
  static List<MyListItem2> items2 = [
    MyListItem2(
      title: 'বিসমিল্লাহির রাহমানির রাহিম',
      subtitle: "পরম করুণাময়, অসীম দয়াবান আল্লাহর নামে",
      arabic: "بِسْمِ اللَّهِ الرَّحْمَنِ \nالرَّحِيمِ",
      image: 'images/c.png',
    ),
    MyListItem2(
      title: 'আর রহমা-নির রহীম।',
      subtitle: "অনন্ত দয়াময়, অতীব দয়ালু।",
      arabic: "ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
      image: 'images/c.png',
    ),
    MyListItem2(
      title: 'মা-লিকি ইয়াওমিদ্দীন।',
      subtitle: "প্রতিফল দিবসের মালিক।",
      arabic: "مَالِكِ يَوْمِ ٱلدِّينِ",
      image: 'images/c.png',
    ),
    MyListItem2(
      title: 'ইয়্যা-কা না’বুদু ওয়া ইয়্যা-কানাছতা’ঈন।',
      subtitle: "আমরা শুধু আপনারই দাসত্ব করি এবং শুধু আপনারই নিকট সাহায্য কামনা করি।",
      arabic: "إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ",
      image: 'images/c.png',
    ),
    MyListItem2(
      title: 'ইহদিনাসসিরা-তাল মুছতাকীম।',
      subtitle: "আমাদের সরল পথনির্দেশ দান করুন।",
      arabic: "ٱهْدِنَا ٱلصِّرَاطَ ٱلْمُسْتَقِيمَ",
      image: 'images/c.png',
    ),
    MyListItem2(
      title: 'সিরা-তাল্লাযীনা আন’আম তা’আলাইহিম।',
      subtitle: "তাদের পথে, যাদের আপনি অনুগ্রহ করেছেন।",
      arabic: "صِرَاطَ ٱلَّذِينَ أَنْعَمْتَ عَلَيْهِمْ",
      image: 'images/c.png',
    ),
    MyListItem2(
      title: 'গাইরিল মাগদূ বি’আলাইহীম ওয়ালাদ্দাল্লীন। (আমিন )',
      subtitle: "এবং তাদের পথে নয় যারা আপনার ক্রোধের শিকার ও পথভ্রষ্ট । ( কবুল করুন )",
      arabic: "غَيۡرِ ٱلْمَغْضُوبِ عَلَيۡهِمۡ وَلَا اَ۬لضَّآلِّينَ ",
      image: 'images/c.png',
    ),
  ];
  static List<MyListItem3> items3 = [
    MyListItem3(

      image: 'images/allfat.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),
    MyListItem3(

      image: 'images/finalbak.png',
    ),

  ];
}

class MyListItem {
  final String title;
  final String image;

  MyListItem({
    required this.title,
    required this.image,
  });
}

class MyListItem2 {
  final String title;
  final String subtitle;
  final String arabic;
  final String image;

  MyListItem2(
      {required this.title,
      required this.image,
      required this.subtitle,
      required this.arabic});
}
class MyListItem3 {

  final String image;

  MyListItem3(
      {
        required this.image,

      });
}
