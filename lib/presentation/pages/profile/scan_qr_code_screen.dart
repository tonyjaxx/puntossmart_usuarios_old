// import 'package:flutter/material.dart';
// import 'package:flutter_remix/flutter_remix.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:puntossmart/infrastructure/services/local_storage.dart';
// import 'package:puntossmart/presentation/pages/friends/controller/friend_controller.dart';

// import '../../theme/app_style.dart';

// class ScanQrCodeScreen extends StatefulWidget {
//   const ScanQrCodeScreen({super.key});

//   @override
//   State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
// }

// class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
//   FriendController friendController = Get.put(FriendController());
//   String uuid = "";
//   int count = 0;

//   @override
//   Widget build(BuildContext context) {
//     final bool isLtr = LocalStorage.getLangLtr();
//     return Directionality(
//         textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
//         child: Scaffold(
//           backgroundColor: AppStyle.bgGrey,
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: AppStyle.bgGrey,
//             leading: IconButton(
//               splashRadius: 18.0,
//               onPressed: () => Navigator.of(context).pop(),
//               icon: Icon(
//                 isLtr
//                     ? FlutterRemix.arrow_left_s_line
//                     : FlutterRemix.arrow_right_s_line,
//                 size: 24.0,
//                 color: AppStyle.black,
//               ),
//             ),
//             title: Text(
//               "QR SMART",
//               style: GoogleFonts.inter(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 18.0,
//                 color: AppStyle.black,
//                 letterSpacing: -0.4,
//               ),
//             ),
//           ),
//           body: MobileScanner(onDetect: (capture) {
//             final List<Barcode> barcodes = capture.barcodes;
//             for (final barcode in barcodes) {
//               final String? rawValue = barcode.rawValue;

//               if (rawValue != null) {
//                 uuid = rawValue;
//                 print("=======SCANNED======");
//                 print(uuid);
//                 friendController.getUserByUUID(context, uuid: uuid);
//               }
//             }
//           }),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'package:get/get.dart';
import 'package:puntossmart/presentation/pages/friends/controller/friend_controller.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({super.key});

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  FriendController friendController = Get.put(FriendController());
  String uuid = "";
  BarcodeCapture? detectedBarcode;

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
            "QR SMART",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: AppStyle.black,
              letterSpacing: -0.4,
            ),
          ),
        ),
        body: Stack(
          children: [
            MobileScanner(
              onDetect: (BarcodeCapture capture) {
                setState(() {
                  detectedBarcode = capture;
                  final String? rawValue = capture.barcodes.first.rawValue;

                  if (rawValue != null) {
                    uuid = rawValue;
                    print("=======SCANNED======");
                    print(uuid);
                    friendController.getUserByUUID(context, uuid: uuid);
                  }
                });
              },
            ),
            if (detectedBarcode != null)
              CustomPaint(
                painter:
                    QrScannerOverlayPainter(detectedBarcode: detectedBarcode!),
              ),
          ],
        ),
      ),
    );
  }
}

class QrScannerOverlayPainter extends CustomPainter {
  final BarcodeCapture detectedBarcode;

  QrScannerOverlayPainter({required this.detectedBarcode});

  @override
  void paint(Canvas canvas, Size size) {
    if (detectedBarcode.barcodes.isEmpty) {
      return;
    }

    final paint = Paint()
      ..color = AppStyle.newThemeColor.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;
//..color = Colors.white
    final borderPaint = Paint()
      ..color = AppStyle.newThemeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    for (final barcode in detectedBarcode.barcodes) {
      final corners = barcode.corners;
      if (corners == null || corners.isEmpty) continue;

      for (int i = 0; i < corners.length; i++) {
        final corner = corners[i];
        final nextCorner = corners[(i + 1) % corners.length];
        canvas.drawLine(Offset(corner.dx, corner.dy),
            Offset(nextCorner.dx, nextCorner.dy), paint);
      }

      final double cornerLength = 20.0;
      final double cornerWidth = 4.0;

      for (final corner in corners) {
        // Top-left corner
        canvas.drawLine(
          Offset(corner.dx, corner.dy),
          Offset(corner.dx + cornerLength, corner.dy),
          borderPaint,
        );
        canvas.drawLine(
          Offset(corner.dx, corner.dy),
          Offset(corner.dx, corner.dy + cornerLength),
          borderPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
