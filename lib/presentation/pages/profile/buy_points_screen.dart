import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/pages/friends/controller/friend_controller.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';

class BuyPointsScreen extends StatefulWidget {
  BuyPointsScreen({
    super.key,
  });

  @override
  State<BuyPointsScreen> createState() => _BuyPointsScreenState();
}

class _BuyPointsScreenState extends State<BuyPointsScreen> {
  FriendController friendController = Get.put(FriendController());
  int points = 0;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.getLangLtr();

    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppStyle.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppStyle.bgGrey,
          leading: IconButton(
            splashRadius: 18.0,
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              isLtr
                  ? FlutterRemix.arrow_left_s_line
                  : FlutterRemix.arrow_right_s_line,
              size: 24.0,
              color: AppStyle.black,
            ),
          ),
          title: Text(
            'Buy Puntos Smart',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: AppStyle.black,
              letterSpacing: -0.4,
            ),
          ),
        ),
        body: Center(
          child: Text(
            "Coming Soon",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
              color: AppStyle.black,
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        //   child: Container(
        //     width: double.infinity,
        //     height: MediaQuery.of(context).size.height * 0.23,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: Color(0xffbdbdbe),
        //     ),
        //     child:
        //      Stack(
        //       children: [
        //         Align(
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 "100",
        //                 style: GoogleFonts.inter(
        //                   fontWeight: FontWeight.w500,
        //                   fontSize: 14.0,
        //                   color: AppStyle.black,
        //                 ),
        //               )
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
