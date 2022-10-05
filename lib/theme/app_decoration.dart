import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get groupstylecornerradius => BoxDecoration(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            9.84,
          ),
        ),
        border: Border.all(
          color: ColorConstant.gray4007f,
          width: getHorizontalSize(
            0.98,
          ),
        ),
      );
  static BoxDecoration get textstylepoppinsregular161 => BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        ),
        border: Border.all(
          color: ColorConstant.gray400,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get groupstylewhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get groupstylegray100B2cornerradius => BoxDecoration(
        color: ColorConstant.gray100B2,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            16.72,
          ),
        ),
      );
  static BoxDecoration get groupstyleblack900cornerradius => BoxDecoration(
        color: ColorConstant.black900,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            50.00,
          ),
        ),
      );
  static BoxDecoration get groupstylewhiteA700cornerradius => BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              50.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              50.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90040,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get groupstyleorange400cornerradius => BoxDecoration(
        color: ColorConstant.orange400,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            50.00,
          ),
        ),
      );
  static BoxDecoration get groupstyle => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            7.288275142314926e-17,
          ),
          end: Alignment(
            0.5000000000000002,
            1.0000000000000002,
          ),
          colors: [
            ColorConstant.whiteA70000,
            ColorConstant.whiteA700,
          ],
        ),
      );
}
