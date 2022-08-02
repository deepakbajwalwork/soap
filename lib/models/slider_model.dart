import 'package:flutter/material.dart';

import '../views/onboard/onboard_screen1.dart';
import '../views/onboard/onboard_screen2.dart';
import '../views/onboard/onboard_screen3.dart';

class SliderModel{
  Widget? image;

// images given
  SliderModel({this.image});

// setter for image
  void setImage(Widget getImage){
    image = getImage;
  }
// getter for image
  Widget? getImage(){
    return image;
  }
}
List<SliderModel> getSlides(){
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel();

  // 1
  sliderModel.setImage(OnBoardScreen1());
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  // 2
  sliderModel.setImage(OnBoardScreen2());
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  // 3
  sliderModel.setImage(OnBoardScreen3());
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  return slides;
}