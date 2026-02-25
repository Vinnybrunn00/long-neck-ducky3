
import 'package:flutter/material.dart';
import 'package:long_neck_duck3/constants/app_color.dart';

final InputDecoration inputDecorationDropDown = InputDecoration(
  contentPadding: EdgeInsets.all(10),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.greenColor),
    borderRadius: BorderRadius.circular(12),
  ),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
);

final TextStyle textStyleHintDropDown = TextStyle(
  color: AppColor.whiteColor,
  fontSize: 14,
);
