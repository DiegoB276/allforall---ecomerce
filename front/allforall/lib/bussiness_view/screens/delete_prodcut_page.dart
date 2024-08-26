/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/bussiness_view/widgets/bussiness_drawer.dart';
import 'package:allforall/bussiness_view/widgets/bussiness_text_form.dart';
import 'package:allforall/bussiness_view/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class DeleteProdcutPage extends StatefulWidget {
  const DeleteProdcutPage({super.key});

  @override
  State<DeleteProdcutPage> createState() => _DeleteProdcutPageState();
}

class _DeleteProdcutPageState extends State<DeleteProdcutPage> {
  late TextEditingController codeProductController;

  //QR variables
  bool statusQRButton = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? result;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code;
        codeProductController.text = result.toString();
        statusQRButton = false;
      });
    });
  }

  void changeStatusQRButton() {
    setState(() {
      statusQRButton = true;
    });
  }

  void setQRData() {
    setState(() {
      statusQRButton = false;
      if (result == null) {
        codeProductController.text = "";
      } else {
        () => codeProductController.text = result.toString();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    codeProductController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    codeProductController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Eliminar Productos"),
      ),
      drawer: const Drawer(
        child: BussinessDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Código o ID del Producto",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),
              //Code TextField with QR widget
              Row(
                children: [
                  Expanded(
                    child: BussinessTextForm(
                      controller: codeProductController,
                      hintText: "XXXXXXXXXX",
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: changeStatusQRButton,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.qr_code_2_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              statusQRButton
                  ? Column(
                      children: [
                        SizedBox(
                          height: 300,
                          child: QRView(
                            key: qrKey,
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
                            setQRData();
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
                    )
                  : const SizedBox(
                      height: 10,
                    ),

              Center(
                child: BussinessButton(
                  label: "Buscar",
                  backgroundColor: Colors.black,
                  hoverColor: Colors.grey.shade700,
                  textColor: Colors.white,
                  textSize: 17,
                  width: MediaQuery.sizeOf(context).width * 0.35,
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
