import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanQrCodeScreen extends StatefulWidget {
  @override
  _ScanQrCodeScreenState createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  String qrResult = "Not yet scanned";

  Future<void> _scanQR() async {
    try {
      String? scanResult = await scanner.scan();
      setState(() {
        qrResult = scanResult ?? "";
      });
    } catch (e) {
      setState(() {
        qrResult = "Failed to get QR code.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Result: $qrResult",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanQR,
              child: Text("Scan QR Code"),
            ),
          ],
        ),
      ),
    );
  }
}
