import 'package:flutter/material.dart';
import 'package:siuuu_store/screeens/itemlist_form.dart';
import 'package:siuuu_store/screeens/menu.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  "SIUUU STORE",
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Stay updated with the latest football items!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                )
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text("Tambah Produk"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemFormPage(),
                )
              );
            },
          ),
        ],
      )
    );
  }
}