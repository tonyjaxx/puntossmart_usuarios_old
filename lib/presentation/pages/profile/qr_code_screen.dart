import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/pages/profile/scan_qr_code_screen.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({super.key});

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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScanQrCodeScreen()));
                },
                icon: const Icon(
                  FlutterRemix.qr_scan_2_line,
                  color: AppStyle.black,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: LocalStorage.getUserUuid(),
                version: QrVersions.auto,
                size: 300.0,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Puntos Smart",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 25.0,
                  color: AppStyle.black,
                  letterSpacing: -0.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
