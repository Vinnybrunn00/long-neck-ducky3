

import 'package:flutter/material.dart';
import 'package:long_neck_duck3/constants/app_color.dart';
import 'package:long_neck_duck3/core/models/assets_models.dart';

class BoxIconsOffice extends StatelessWidget {
  final AssetsModels iconsOffice;
  const BoxIconsOffice({super.key, required this.iconsOffice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Tooltip(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: iconsOffice.color,
        ),
        message: iconsOffice.title,
        child: Material(
          elevation: 10,
          color: AppColor.blackBlueColor,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.only(left: 14, right: 14, top: 6, bottom: 6),
            child: Image(
              image: AssetImage(iconsOffice.path.toString()),
              width: 33,
            ),
          ),
        ),
      ),
    );
  }
}
