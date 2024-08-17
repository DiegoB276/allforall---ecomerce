import 'package:allforall/bussiness_view/utils/product_categories.dart';
import 'package:allforall/bussiness_view/widgets/bussiness_text_form.dart';
import 'package:allforall/bussiness_view/widgets/bussiness_drawer.dart';
import 'package:allforall/bussiness_view/widgets/button.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../widgets/add_product_page/list_view_images_selected.dart';
import '../widgets/add_product_page/text_form_section.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  late TextEditingController codeProductController;
  late TextEditingController nameProductController;
  late TextEditingController descriptionProductController;
  late TextEditingController priceProductController;
  late TextEditingController amountProductController;

  String dropdownValue = categories.first;

  //Images Variables
  final ImagePicker picker = ImagePicker();
  List<XFile>? selectedImages = [];
  List<XFile> finalSelectedImages = [];
  List<String> imagesToSend = [];
  bool isConfirmImages = false;

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

  Future<void> pickImages() async {
    final List<XFile> images = await picker.pickMultiImage();
    if (images.isNotEmpty) {
      setState(() {
        isConfirmImages = false;
        selectedImages = images;
      });
    }
  }

  void addImagesToNewList() {
    finalSelectedImages = selectedImages!;
  }

  void formatImage() {
    for (var i in finalSelectedImages) {
      var aux = i.path.split("/").last;
      imagesToSend.add(aux);
    }
  }

  void sendImage() {
    addImagesToNewList();
    formatImage();
    setState(() {
      isConfirmImages = true;
    });
    print(imagesToSend);
  }

  void onPressCancelButton() {
    codeProductController.clear();
    nameProductController.clear();
    descriptionProductController.clear();
    priceProductController.clear();
    amountProductController.clear();
    isConfirmImages = false;
    imagesToSend = [];
    finalSelectedImages = [];
    selectedImages = [];
  }

  @override
  void initState() {
    super.initState();
    codeProductController = TextEditingController();
    nameProductController = TextEditingController();
    descriptionProductController = TextEditingController();
    priceProductController = TextEditingController();
    amountProductController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
    codeProductController.dispose();
    nameProductController.dispose();
    descriptionProductController.dispose();
    priceProductController.dispose();
    amountProductController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Agregar Producto"),
      ),
      drawer: const Drawer(
        child: BussinessDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Crea tu Producto",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                const Text(
                  "ID o Código del Producto",
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: BussinessTextForm(
                        controller: codeProductController,
                        hintText: "XXXXXXXXXXX",
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
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                TextFormsSection(
                  nameProductController: nameProductController,
                  descriptionProductController: descriptionProductController,
                  priceProductController: priceProductController,
                  amountProductController: amountProductController,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Categoría del producto",
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items:
                      categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  validator: (value) => value == null
                      ? 'Por favor selecciona una categoría'
                      : null,
                ),

                const SizedBox(height: 30),

                //Images Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Imagen Promocional',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        !isConfirmImages ? pickImages() : null;
                      },
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Text(
                        "Subir Imagenes",
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                if (selectedImages != null && selectedImages!.isNotEmpty) ...[
                  ListViewImagesSelected(selectedImages: selectedImages),
                  const SizedBox(height: 10),
                  Center(
                    child: (!isConfirmImages)
                        ? MaterialButton(
                            onPressed: sendImage,
                            color: Colors.red[400],
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Confirmar imágenes",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],

                const Divider(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BussinessButton(
                      label: "Cancelar",
                      backgroundColor: Colors.purple,
                      hoverColor: Colors.red.shade300,
                      textColor: Colors.white,
                      textSize: 17,
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      onTap: () {
                        setState(() {
                          onPressCancelButton();
                        });
                      },
                    ),
                    BussinessButton(
                      label: "Aceptar",
                      backgroundColor: Colors.black,
                      hoverColor: Colors.grey.shade700,
                      textColor: Colors.white,
                      textSize: 17,
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
