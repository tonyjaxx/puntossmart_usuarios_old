import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/pages/friends/controller/friend_controller.dart';
import 'package:puntossmart/presentation/pages/profile/send_point_by_qr_code.dart';

import '../../theme/app_style.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({super.key});

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  FriendController friendController = Get.put(FriendController());
  String uuid = "";
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.getLangLtr();
    return Directionality(
        textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
        child: Scaffold(
          backgroundColor: AppStyle.bgGrey,
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
              "QR Code",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
                color: AppStyle.black,
                letterSpacing: -0.4,
              ),
            ),
          ),
          body: MobileScanner(onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            for (final barcode in barcodes) {
              final String? rawValue = barcode.rawValue;

              if (rawValue != null) {
                uuid = rawValue;
                print("=======SCANNED======");
                print(uuid);
                friendController.getUserByUUID(context, uuid: uuid);
              }
            }
          }),
        ));
  }
}
