import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/get_started_screen/models/carousel_model.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  CarouselController buttonCarouselController = CarouselController();

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: carouselsList.length,
            options: CarouselOptions(
                viewportFraction: 1,
                height: getVerticalSize(460),
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index)),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              var carousellist = carouselsList[index];
              return Center(
                child: CarouselCard(carousels: carousellist),
              );
            },
          ),
          SizedBox(
            height: getVerticalSize(30),
          ),
          buildIndicator()
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: carouselsList.length,
        effect: ExpandingDotsEffect(
            dotWidth: getHorizontalSize(10),
            dotHeight: getVerticalSize(10),
            activeDotColor: ColorConstant.xenteblue,
            dotColor: Colors.black12),
      );
}

class CarouselCard extends StatelessWidget {
  final Carousels carousels;
  const CarouselCard({Key? key, required this.carousels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 235.w,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          carousels.description,
          style: AppStyle.textstyleregular25,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: getVerticalSize(5),
        ),
        Container(
          width: getHorizontalSize(388),
          height: getVerticalSize(350),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(carousels.image),
              // fit: BoxFit.cover,
            ),
          ),
        ),
      ]),
    );
  }
}
