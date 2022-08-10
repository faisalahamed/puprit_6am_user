import 'package:flutter/material.dart';

class BulkData {
  // static String description = "Working Environments - Great for medical, manufacturing, restaurant or food service employee, especially widely apply to home kitchen and food manufacturing industry; \n\n\nExtremely Comfortable- non-woven cap is double-stitched elastic band which can keep caps flat and comfortable on the forehead, it's lightweight(only 12gsm per cap), breathable and extremely comfortable to wear for a long time; \nMaterial- These disposable Caps are made from multi-ply polypropylene which is non-toxic and environmentally friendly; this unique advanced material can make these caps maintain your hairstyle during the working and keep your head clean and cozy; \nEasy to wear- The size is 24 which means these caps are easy to fit your head instead of worrying any damage to the product or your hairstyle, very touching, right?! \nConvenient and practical packaging- Product packaging is 100 pcs per bag. The packaging plastic bag is non-toxic and disposable, easy to open and very durable";

  static String description = '''
Working Environments - Great for medical, manufacturing, restaurant or food service employee, especially widely apply to home kitchen and food manufacturing industry;

Extremely Comfortable- non-woven cap is double-stitched elastic band which can keep caps flat and comfortable on the forehead, it's lightweight(only 12gsm per cap), breathable and extremely comfortable to wear for a long time;

Material- These disposable Caps are made from multi-ply polypropylene which is non-toxic and environmentally friendly; this unique advanced material can make these caps maintain your hairstyle during the working and keep your head clean and cozy;

Easy to wear- The size is 24" which means these caps are easy to fit your head instead of worrying any damage to the product or your hairstyle, very touching, right?!

Convenient and practical packaging- Product packaging is 100 pcs per bag. The packaging plastic bag is non-toxic and disposable, easy to open and very durable
''';

  static String disclaimer =
      '''The information provided herein is accurate, updated and complete as per the best practices of the Company. Please note that this information should not be treated as a replacement for physical medical consultation or advice. We do not guarantee the accuracy and the completeness of the information so provided. The absence of any information and/or warning to any drug shall not be considered and assumed as an implied assurance of the Company. We do not take any responsibility for the consequences arising out of the aforementioned information and strongly recommend you for a physical consultation in case of any queries or doubts.''';
}

class Category {
  String title;
  String image;

  Category({
    @required this.title,
    @required this.image,
  });
}

class Order {
  String title;

  Order({this.title});
}

List orderList = [
  Order(title: "All"),
  Order(title: "Confirmed"),
  Order(title: "Delivering"),
  Order(title: "Delivered"),
];

List categoryList = [
  Category(
      title: 'covid',
      image:
          'https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJjYXRlZ29yeVwvMTMucG5nIiwiZWRpdHMiOltdfQ=='),
  Category(
      title: 'Women Care',
      image:
          'https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJjYXRlZ29yeVwvMjAucG5nIiwiZWRpdHMiOltdfQ=='),
  Category(
      title: 'Devices',
      image:
          'https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJjYXRlZ29yeVwvMTQucG5nIiwiZWRpdHMiOltdfQ=='),
  Category(
      title: 'Self Care',
      image:
          'https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJjYXRlZ29yeVwvMjEucG5nIiwiZWRpdHMiOltdfQ=='),
  Category(
      title: 'covid',
      image:
          'https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJjYXRlZ29yeVwvMTkucG5nIiwiZWRpdHMiOltdfQ=='),
  Category(
      title: 'Women Care',
      image:
          'https://www.kindpng.com/picc/m/376-3768467_transparent-healthcare-icon-png-patient-info-icon-png.png'),
  Category(
      title: 'covid',
      image:
          'https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJjYXRlZ29yeVwvMTMucG5nIiwiZWRpdHMiOltdfQ=='),
  Category(
      title: 'Women Care',
      image:
          'https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJjYXRlZ29yeVwvMjAucG5nIiwiZWRpdHMiOltdfQ=='),
  Category(
      title: 'Devices',
      image:
          'https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJjYXRlZ29yeVwvMTQucG5nIiwiZWRpdHMiOltdfQ=='),
  Category(
      title: 'Self Care',
      image:
          'https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJjYXRlZ29yeVwvMjEucG5nIiwiZWRpdHMiOltdfQ=='),
  Category(
      title: 'covid',
      image:
          'https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJjYXRlZ29yeVwvMTkucG5nIiwiZWRpdHMiOltdfQ=='),
  Category(
      title: 'Women Care',
      image:
          'https://www.kindpng.com/picc/m/376-3768467_transparent-healthcare-icon-png-patient-info-icon-png.png'),
  Category(
      title: 'All',
      image: 'https://vectorified.com/images/category-icon-9.png'),
];
