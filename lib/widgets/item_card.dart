import 'package:flutter/material.dart';
import 'package:siuuu_store/screens/itemlist_form.dart';
import 'package:siuuu_store/screens/menu.dart';
import 'package:siuuu_store/screens/item_entry_list.dart';
import 'package:siuuu_store/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage itemHomePage;

  const ItemCard(this.itemHomePage, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: itemHomePage.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text("Kamu telah menekan tombol ${itemHomePage.name}"))
          );
          if (itemHomePage.name == "Create Products") {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const ItemFormPage()),
            );
          } else if (itemHomePage.name == "All Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ItemEntryListPage(showMyItems: false)
              ),
            );
          } else if (itemHomePage.name == "My Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ItemEntryListPage(showMyItems: true)
              ),
            );
          } else if (itemHomePage.name == "Logout") {              
              final response = await request.logout(
              "http://localhost:8000/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                  if (response['status']) {
                      String uname = response["username"];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message See you again, $uname."),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                  } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(message),
                          ),
                      );
                  }
              }
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