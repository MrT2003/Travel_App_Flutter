import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/constants/dimension.dart';
import 'package:travel_app_flutter/core/constants/textstyle.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/core/helpers/image_helper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = 'intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  Widget _buildItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignment) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
      child: Column(
        children: [
          Container(
            alignment: alignment,
            child: ImageHelper.loadFromAsset(
              image,
              height: 375,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: kMediumPadding * 2,
          ),
          Column(
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildItemIntroScreen(
              AssetHelper.imageIntro1,
              'Book a flight',
              'Found a flight that matches your destination and schedule? Book it instantly.',
              Alignment.centerRight),
          _buildItemIntroScreen(
              AssetHelper.imageIntro2,
              'Find a hotel room',
              'Select the day, book your room. We give you the best price.',
              Alignment.center),
          _buildItemIntroScreen(
              AssetHelper.imageIntro3,
              'Enjoy your trip',
              'Easy discovering new places and share these between your friends and travel together.',
              Alignment.centerLeft),
        ],
      ),
    );
  }
}
