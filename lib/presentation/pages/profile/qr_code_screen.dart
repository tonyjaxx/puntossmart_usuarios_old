import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/pages/profile/scan_qr_code_screen.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({super.key});

  Future<void> _shareQrCode(String uuid) async {
    try {
      final qrValidationResult = QrValidator.validate(
        data: uuid,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.L,
      );
      if (qrValidationResult.status == QrValidationStatus.valid) {
        final qrCode = qrValidationResult.qrCode;
        final painter = QrPainter.withQr(
          qr: qrCode!,
          color: const Color(0xFF000000),
          emptyColor: const Color(0xFFFFFFFF),
          gapless: true,
          embeddedImageStyle: null,
          embeddedImage: null,
        );
        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/qr_code.png';
        final picData = await painter.toImageData(300);
        await _writeToFile(picData!, filePath);
        await FlutterShare.shareFile(
          title: 'Share QR Code',
          text: 'Here is my QR code',
          filePath: filePath,
        );
      }
    } catch (e) {
      print('Error sharing QR code: $e');
    }
  }

  Future<void> _writeToFile(ByteData data, String path) async {
    final buffer = data.buffer;
    await File(path).writeAsBytes(
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.getLangLtr();
    final String uuid = LocalStorage.getUserUuid();

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
            AppLocalizations.of(context)!.qr_code,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: AppStyle.black,
              letterSpacing: -0.4,
            ),
          ),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 8.0),
          //     child: IconButton(
          //       onPressed: () {
          //         Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const ScanQrCodeScreen()));
          //       },
          //       icon: const Icon(
          //         FlutterRemix.qr_scan_2_line,
          //         color: AppStyle.black,
          //       ),
          //     ),
          //   ),
          // ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding:
              const EdgeInsets.symmetric(horizontal: 15.0 /*, vertical: 55.0*/),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              QrImageView(
                data: uuid,
                version: QrVersions.auto,
                size: 300.0,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Escanear",
                style: GoogleFonts.bungee(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                  color: AppStyle.newThemeColor,
                  letterSpacing: -0.4,
                ),
              ),
              Text(
                "QR SMART",
                style: GoogleFonts.bungee(
                  fontWeight: FontWeight.w700,
                  fontSize: 40.0,
                  color: AppStyle.newThemeColor,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppStyle.white,
                  borderRadius: BorderRadius.circular(
                      45.0), // Ajusta el valor según sea necesario
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // Color de la sombra con opacidad
                      spreadRadius: 3, // Radio de propagación de la sombra
                      blurRadius: 5, // Radio de desenfoque de la sombra
                      offset: const Offset(
                          0, 3), // Desplazamiento de la sombra (x, y)
                    ),
                  ],
                ),
                height: MediaQuery.sizeOf(context).width - 310.w, // ||
                width: MediaQuery.sizeOf(context).width - 210.w, //---
                // child: IconButton(
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => const ScanQrCodeScreen()));
                //   },
                //   icon: const FittedBox(
                //     child: Icon(
                //       FlutterRemix.qr_scan_2_line,
                //       color: AppStyle.newThemeColor,
                //       size: 150,
                //     ),
                //   ),

                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ScanQrCodeScreen()));
                      },
                      icon: const FittedBox(
                        child: Icon(
                          FlutterRemix.qr_scan_2_line,
                          color: AppStyle.newThemeColor,
                          size: 150,
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 8.0), // Espacio entre el icono y el texto
                    Text(
                      "SCAN",
                      style: GoogleFonts.bungee(
                        fontWeight: FontWeight.w700,
                        fontSize: 25.0,
                        color: AppStyle.newThemeColor,
                        letterSpacing: -0.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
