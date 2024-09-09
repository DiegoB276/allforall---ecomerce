/*
  © All rights reserved.
  © By allforall - 2024
*/

import 'package:allforall/bussiness_view/widgets/add_product_page/title_camp_text.dart';
import 'package:allforall/bussiness_view/widgets/bussiness_text_form.dart';
import 'package:allforall/user_view/controllers/register_page_controller.dart';
import 'package:allforall/user_view/screens/login_page.dart';
import 'package:allforall/utils/country_state_city.dart';
import 'package:allforall/user_view/widgets/date_box_selector.dart';
import 'package:allforall/user_view/widgets/login_page_widgets/login_text_field.dart';
import 'package:country_state_city/country_state_city.dart' as CP;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController nameController;
  late TextEditingController lastnameController;
  late TextEditingController phoneController;
  late TextEditingController idController;
  late TextEditingController dateController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController addressController;
  bool pressedLogin = false;
  bool isHintPassword = true;
  String infoDate = "";

//Countries_City variables.
  List<CP.Country> countries = [];
  List<CP.State> states = [];
  List<CP.City> cities = [];
  CP.Country? selectedCountry;
  CP.State? selectedState;
  CP.City? selectedCity;
  String countryCode = "";
  String stateCode = "";

  void getCountries() async {
    final List<CP.Country> dataCountry =
        await CountryStateCityClass.getCountries();

    setState(() {
      countries = dataCountry;
    });
  }

  void getStates(String code) async {
    final List<CP.State> dataStates =
        await CountryStateCityClass.getStatesByCountry(code);
    setState(() {
      states = dataStates;
    });
  }

  void getCities(String countryCode, String stateCode) async {
    final List<CP.City> dataCities =
        await CountryStateCityClass.getcitiesByCountryStateCode(
            countryCode, stateCode);
    setState(() {
      cities = dataCities;
    });
  }

  Future<void> selectDate(BuildContext context) async {
    try {
      DateTime? dateTimePicker = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        useRootNavigator: true,
      );

      if (dateTimePicker != null) {
        setState(() {
          String formattedDate =
              DateFormat('yyyy-MM-dd').format(dateTimePicker);
          infoDate = formattedDate;
        });
      }
    } catch (e) {
      e.toString();
    }
  }

  void setVisibility() {
    setState(() {
      isHintPassword = !isHintPassword;
    });
  }

  void sendData(
    String email,
    String password,
    String rol,
    String image,
    String name,
    String lastname,
    String phone,
    String idDoc,
    String country,
    String state,
    String city,
    String bornDate,
    String address,
  ) async {
    final bool registerProcess = await RegisterPageController.registerStatus(
      email,
      password,
      rol,
      image,
      name,
      lastname,
      phone,
      idDoc,
      country,
      state,
      city,
      bornDate,
      address,
    );
    if (registerProcess) {
      correctRegister();
      return;
    }
    errorOnRegister("Error al crear cuenta");
    return;
  }

  void correctRegister() async {
    setState(() {
      pressedLogin = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Cuenta creada con éxito."),
      ),
    );
  }

  void errorOnRegister(String message) async {
    setState(() {
      pressedLogin = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    lastnameController = TextEditingController();
    phoneController = TextEditingController();
    idController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    addressController = TextEditingController();
    getCountries();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();
    idController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          "Crea tu Cuenta",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TittleCampProduct(label: "Nombres"),
                BussinessTextForm(
                  controller: nameController,
                  hintText: "Ej: Pepito Alonso",
                  textInputType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 15),
                const TittleCampProduct(label: "Apellidos"),
                BussinessTextForm(
                  controller: lastnameController,
                  hintText: "Ej: Perez Gutierres",
                  textInputType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 15),
                const TittleCampProduct(label: "Celular"),
                BussinessTextForm(
                  controller: phoneController,
                  hintText: "Ej: XXXXXXXXXX",
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                const TittleCampProduct(label: "Número de Documento"),
                BussinessTextForm(
                  controller: idController,
                  hintText: "Ej: XXXXXXXXXX",
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                const TittleCampProduct(label: "País"),
                DropdownButtonFormField<CP.Country>(
                  value: selectedCountry,
                  hint: const Text('Selecciona un Pais'),
                  items: countries.map((CP.Country country) {
                    return DropdownMenuItem<CP.Country>(
                      value: country,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        child: Text(
                          country.name,
                        ),
                      ),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  onChanged: (CP.Country? newValue) {
                    setState(() {
                      selectedCountry = newValue;
                      selectedState = null; // Reinicia el estado seleccionado
                      getStates(selectedCountry!.isoCode);
                    });
                  },
                ),
                const SizedBox(height: 15),
                const TittleCampProduct(label: "Departamento"),
                DropdownButtonFormField<CP.State>(
                  value: selectedState,
                  hint: const Text('Selecciona un Departamento'),
                  items: states.map((CP.State state) {
                    return DropdownMenuItem<CP.State>(
                      value: state,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        child: Text(
                          state.name,
                        ),
                      ),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  onChanged: (CP.State? newValue) {
                    setState(() {
                      selectedState = newValue;
                      selectedCity = null;
                      getCities(
                        selectedState!.countryCode,
                        selectedState!.isoCode,
                      );
                    });
                  },
                ),
                const SizedBox(height: 15),
                const TittleCampProduct(label: "Ciudad"),
                DropdownButtonFormField<CP.City>(
                  value: selectedCity,
                  hint: const Text('Selecciona una Ciudad'),
                  items: cities.map((CP.City city) {
                    return DropdownMenuItem<CP.City>(
                      value: city,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        child: Text(
                          city.name,
                        ),
                      ),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  onChanged: (CP.City? newValue) {
                    setState(() {
                      selectedCity = newValue;
                    });
                  },
                ),
                const SizedBox(height: 15),
                const TittleCampProduct(label: "Dirección de Residencia"),
                BussinessTextForm(
                  controller: addressController,
                  hintText: "Ej: Cra 7 #4-27 Barrio...",
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 15),
                const TittleCampProduct(label: "Fecha de Nacimiento"),
                DateBoxSelector(
                  onTap: () async => await selectDate(context),
                  infoDate: infoDate,
                ),
                const SizedBox(height: 15),
                const TittleCampProduct(label: "Correo Electrónico"),
                BussinessTextForm(
                  controller: emailController,
                  hintText: "Ej: ejemplo@ejemplo.com",
                  textInputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                ),
                const SizedBox(height: 15),
                const TittleCampProduct(label: "Contraseña"),
                LoginTextFormPassword(
                  passwordController: passwordController,
                  isHint: isHintPassword,
                  onTap: setVisibility,
                ),
                const SizedBox(height: 15),
                const TittleCampProduct(label: "Confirmar Contraseña"),
                LoginTextFormPassword(
                  passwordController: confirmPasswordController,
                  isHint: isHintPassword,
                  onTap: setVisibility,
                ),

                const SizedBox(height: 40),

                pressedLogin
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SizedBox.shrink(),
                //Login Button
                Button(
                  label: "Registrar",
                  backgroundColor: Colors.black,
                  hoverColor: Colors.grey.shade700,
                  textColor: Colors.white,
                  textSize: 23,
                  width: MediaQuery.sizeOf(context).width,
                  onTap: () async {
                    setState(() {
                      pressedLogin = true;
                    });
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      errorOnRegister("Las contraseñas no coinciden");
                      return;
                    }
                    if (RegisterPageController.validateFields(
                          emailController.text,
                          passwordController.text,
                          "3",
                          "assets/icons/logo.png",
                          nameController.text,
                          lastnameController.text,
                          phoneController.text,
                          idController.text,
                          selectedCountry!.name,
                          selectedState!.name,
                          selectedCity!.name,
                          infoDate,
                          addressController.text,
                        ) ==
                        0) {
                      sendData(
                        emailController.text,
                        passwordController.text,
                        "3",
                        "assets/icons/logo.png",
                        nameController.text,
                        lastnameController.text,
                        phoneController.text,
                        idController.text,
                        selectedCountry!.name,
                        selectedState!.name,
                        selectedCity!.name,
                        infoDate,
                        addressController.text,
                      );
                      return;
                    }

                    errorOnRegister("Error al crear cuenta");
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                //Register Button
                Center(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    color: const Color.fromARGB(255, 231, 231, 231),
                    textColor: Colors.black,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    minWidth: MediaQuery.sizeOf(context).width * 0.5,
                    child: const Text(
                      "Inicia Sesión",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
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
