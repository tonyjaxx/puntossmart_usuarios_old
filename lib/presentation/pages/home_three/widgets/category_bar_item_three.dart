import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puntossmart/presentation/components/custom_network_image.dart';
import 'package:puntossmart/presentation/theme/theme.dart';

class CategoryBarItemThree extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const CategoryBarItemThree(
      {super.key,
      required this.image,
      required this.title,
      this.isActive = false,
      required this.onTap});

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       margin: EdgeInsets.only(right: 8.r),
  //       height: 40.h,
  //       padding: REdgeInsets.all(8),
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(10.r)),
  //           color: isActive ? AppStyle.recommendBg : AppStyle.brandGreen),
  //       child: InkWell(
  //         onTap: onTap,
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             CustomNetworkImage(
  //               url: image,
  //               height: 32.r,
  //               width: 32.r,
  //               radius: 0,
  //               fit: BoxFit.cover,
  //             ),
  //             6.horizontalSpace,
  //             Text(
  //               title,
  //               style: AppStyle.interNormal(
  //                 size: 12,
  //                 color: AppStyle.black,
  //               ),
  //               maxLines: 1,
  //               overflow: TextOverflow.ellipsis,
  //               textAlign: TextAlign.center,
  //             ),
  //           ],
  //         ),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.r),
      //height: 70.h,
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(45.r)), //10
        color: isActive ? AppStyle.recommendBg : AppStyle.brandGreen,
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //color: Colors.red,
              child: ClipOval(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  child: CustomNetworkImage(
                    url: image,
                    height: 60.r, // Ajusta el tamaño según sea necesario
                    width: 60.r, // Ajusta el tamaño según sea necesario
                    radius: 10.r,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // SizedBox(height: 8.h), //8
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 8), // Ajusta el padding según sea necesario
              child: Text(
                title,
                style: AppStyle.interNormal(
                  size: 12,
                  color: AppStyle.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
