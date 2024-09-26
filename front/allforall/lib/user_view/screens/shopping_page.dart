import 'package:allforall/user_view/services/api.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  int userId = 0;
  SharedPreferences? pref;

//Obtiene el id del usuario.
  void getUserById() async {
    pref = await SharedPreferences.getInstance();
    final id = await pref!.getInt("user_id")!;
    setState(() {
      userId = id;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          "Mis Compras",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: APIService.getShoppingUser(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  LoadingAnimationWidget.inkDrop(color: Colors.black, size: 40),
            );
          }
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No tienes compras aún",
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Text("${snapshot.data![index]['prod']}");
            },
          );
        },
      ),
    );
  }
}
