import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import 'animation_button_effect.dart';

class CustomButton extends StatelessWidget {
  final Icon? icon;
  final String title;
  final bool isLoading;
  final Function()? onPressed;
  final Color background;
  final Color borderColor;
  final Color textColor;
  final double weight;
  final double radius;
  final EdgeInsets padding; //knjt 22-07-2024

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.background = AppStyle.brandGreen,
    this.textColor = AppStyle.black,
    this.weight = double.infinity,
    this.radius = 8,
    this.icon,
    this.borderColor = AppStyle.transparent,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return AnimationButtonEffect(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(
              color:
                  borderColor == AppStyle.transparent ? background : borderColor,
              width: 2.r),
          elevation: 0,
          shadowColor: AppStyle.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
          ),
          minimumSize: Size(weight, 50.h),
          backgroundColor: background,
          padding: padding, // Apply the padding knjt
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 20.r,
                height: 20.r,
                child: CircularProgressIndicator(
                  color: textColor,
                  strokeWidth: 2.r,
                ),
              )
              : Wrap( // Cambiado de Row a Wrap para permitir ajuste de línea 
                alignment: WrapAlignment.center, // Centramos el contenido
                spacing: 10.w, // Espaciado entre icono y texto
                children: [
                  if (icon != null) // Condición para mostrar el icono si existe
                    icon!,
                  Text(
                    title,
                    textAlign: TextAlign.center, // Alineación del texto al centro
                    style: AppStyle.interNormal(
                      size: 15.sp, // Tamaño del texto ajustable
                      color: textColor,
                      letterSpacing: -14 * 0.01,
                    ),
                    maxLines: 2, // Permitir hasta dos líneas de texto
                    overflow: TextOverflow.visible, // Permitir desbordamiento visible
                  ),
                ],
              ),
            // : Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       icon == null
            //           ? const SizedBox()
            //           : Row(
            //               children: [
            //                 icon!,
            //                 10.horizontalSpace,
            //               ],
            //             ),
            //       Text(
            //         title,
            //         style: AppStyle.interNormal(
            //           size: 15,
            //           color: textColor,
            //           letterSpacing: -14 * 0.01,
            //         ),
            //       ),
            //     ],
            //   ),
      ),
    );
  }
}
