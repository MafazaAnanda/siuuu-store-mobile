import 'package:flutter/material.dart';
import 'package:siuuu_store/screeens/itemlist_form.dart';
import 'package:siuuu_store/screeens/menu.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage itemHomePage;

  const ItemCard(this.itemHomePage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: itemHomePage.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text("Kamu telah menekan tombol ${itemHomePage.name}"))
          );
          if (itemHomePage.name == "Tambahk Produk") {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const ItemFormPage()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  itemHomePage.iconData,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  itemHomePage.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}