import 'package:flutter/material.dart';
import 'package:valorant/data/web_service/web-service.dart';

import '../data/repo/repo_layer.dart';

const String baseUrl = 'https://valorant-api.com';
const String methodUrl = '/v1/agents';
const String apiUrl = baseUrl + methodUrl;
final WebService apiProvider = WebService();
final RepoLayer charactersRepository = RepoLayer(apiProvider: apiProvider);

class Constant {
  static const String onBoardingTitleOne = "Agents";
  static const String onBoardingTitleTwo = "Roles";
  static const String onBoardingDescOne =
      "Information about all agents in the game";
  static const String onBoardingDescTwo =
      "Information about each role of the 4 roles in the game";
  static const String onBoardingImageOne = 'assets/images/image1.png';
  static const String onBoardingImageTwo = 'assets/images/roles.jpg';

  static Color onBoardingTitleColor = const Color(0xff222221);
  static Color onBoardingDescColor = const Color(0xffB3B3B3);
  static Color onBoardingButtonColor = const Color(0xffce3d3a);
  static Color primaryColor = const Color(0xffBD3944);
  static Color onBoardingDotsColor = const Color(0xffD9D9D9);

  static TextStyle onBoardingTitleTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    fontFamily: "Valorant",
    color: onBoardingTitleColor,
  );
  static TextStyle onBoardingDescTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    fontFamily: "Valorant",
    color: onBoardingDescColor,
  );
  static TextStyle onBoardingButtonTextStyle = const TextStyle(
    fontSize: 18,
    fontFamily: "Valorant",
    fontWeight: FontWeight.w700,
    color: Color(0xffFFFFFF),
  );

  Constant._();
}
