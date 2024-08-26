/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/bussiness_view/controllers/add_product_page_controllers.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// ignore: must_be_immutable
class QrEnableWidget extends StatefulWidget {
  QrEnableWidget({
    super.key,
    required this.codeController,
  });

  TextEditingController codeController;

  @override
  State<QrEnableWidget> createState() => _QrEnableWidgetState();
}

class _QrEnableWidgetState extends State<QrEnableWidget> {
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        QRControllers.result = scanData.code;
        widget.codeController.text = QRControllers.result.toString();
        QRControllers.statusQRButton = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: QRView(
            key: QRControllers.qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.green,
              borderLength: 20,
              borderWidth: 7,
              borderRadius: 15,
              overlayColor: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 10),
        MaterialButton(
          elevation: 10,
          height: 55,
          minWidth: 160,
          onPressed: () {
            setState(() {
              QRControllers.statusQRButton = false;
              if (QRControllers.result == null) {
                widget.codeController.text = "";
              } else {
                () => widget.codeController.text =
                    QRControllers.result.toString();
              }
            });
          },
          color: const Color.fromARGB(255, 168, 167, 167),
          child: const Text(
            "Cerrar",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
