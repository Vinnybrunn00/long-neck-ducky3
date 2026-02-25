import 'package:flutter/material.dart';
import 'package:long_neck_duck3/core/models/assets_models.dart';

abstract class Utils {
   static ScaffoldFeatureController showErrorMessageFloating({
    required BuildContext context,
    required String message,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        width: MediaQuery.of(context).size.width * .8,
        content: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFF34384F),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.redAccent),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),
    );
  }
  static List<AssetsModels> iconsOffice = [
    AssetsModels(
      title: 'word',
      path: 'assets/icons/word.png',
      color: Color(0xFF3E43AD),
    ),
    AssetsModels(
      title: 'Excel',
      path: 'assets/icons/excel.png',
      color: Color(0xFF58AE57),
    ),
    AssetsModels(
      title: 'Power Point',
      path: 'assets/icons/power_point.png',
      color: Color(0xFFAE7E57),
    ),
    AssetsModels(
      title: 'Outlook',
      path: 'assets/icons/outlook.png',
      color: Color(0xFF577EAE),
    ),
  ];
}
