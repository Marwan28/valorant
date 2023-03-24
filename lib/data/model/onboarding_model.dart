import '../../constant/constant.dart';

class OnBoardingContent {
  String image;
  String title;
  String description;

  OnBoardingContent(
      {required this.image,
        required this.title,
        required this.description,});
}

List pages = [];
List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: Constant.onBoardingTitleOne,
      image: Constant.onBoardingImageOne,
      description: Constant.onBoardingDescOne),
  OnBoardingContent(
      title: Constant.onBoardingTitleTwo,
      image: Constant.onBoardingImageTwo,
      description: Constant.onBoardingDescTwo),
];