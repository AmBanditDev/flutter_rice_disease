import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomIndicatorState();
  }
}

class CustomIndicatorState extends State<CustomIndicator> {
  int currentPos = 0;

  final List<String> imgList = [
    "assets/images/forCarousel/img_carousel1.jpg",
    "assets/images/forCarousel/img_carousel2.jpg",
    "assets/images/forCarousel/img_carousel3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      // decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: imgList.length,
            options: CarouselOptions(
              height: double.infinity,
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPos = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return MyImageView(imgList[index]);
            },
          ),
          Positioned(
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map(
                (url) {
                  int index = imgList.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentPos == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(255, 255, 255, 0.9),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyImageView extends StatelessWidget {
  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image.asset(imgPath, fit: BoxFit.cover),
    );
  }
}
