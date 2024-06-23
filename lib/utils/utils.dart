import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils {
  AppUtils._privateConstructor();

  static getBottomSheet({required List<Widget> children}) => Get.bottomSheet(
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          children: children,
        ),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        isScrollControlled: true,
        ignoreSafeArea: false,
      );
}
