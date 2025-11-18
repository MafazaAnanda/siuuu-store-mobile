import 'package:flutter/material.dart';
import 'package:siuuu_store/screens/itemlist_form.dart';
import 'package:siuuu_store/widgets/left_drawer.dart';
import 'package:siuuu_store/widgets/item_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final String nama = "Mafaza Ananda Rahman";
  final String npm = "2406401306";
  final String kelas = "E";
  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.store, Colors.blue),
    ItemHomepage("My Products", Icons.inventory_2, Colors.green),
    ItemHomepage("Create Products", Icons.add, Colors.red),
    ItemHomepage("Logout", Icons.logout, Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SIUUU STORE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: nama),
                  InfoCard(title: 'Class', content: kelas),
                ],
              ),

              const SizedBox(height: 16.0,),

              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Selamat datang di SIUUU STORE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      
                      children: items.map((ItemHomepage itemHomePage) {
                        return ItemCard(itemHomePage);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title, 
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData iconData;
  final Color color;

  ItemHomepage(this.name, this.iconData, this.color);
}