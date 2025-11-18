import 'package:flutter/material.dart';
import 'package:siuuu_store/models/item_entry.dart';
import 'package:siuuu_store/widgets/left_drawer.dart';
import 'package:siuuu_store/screens/item_detail.dart';
import 'package:siuuu_store/widgets/item_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ItemEntryListPage extends StatefulWidget {
  final bool showMyItems;
  const ItemEntryListPage({super.key, this.showMyItems = false});

  @override
  State<ItemEntryListPage> createState() => _ItemEntryListPageState();
}

class _ItemEntryListPageState extends State<ItemEntryListPage> {
  Future<List<ItemEntry>> fetchNews(CookieRequest request) async {
    final String url = widget.showMyItems 
        ? 'http://localhost:8000/json/my-items/'
        : 'http://localhost:8000/json/';
    
    final response = await request.get(url);
    var data = response;
    
    List<ItemEntry> listItem = [];
    for (var d in data) {
      if (d != null) {
        listItem.add(ItemEntry.fromJson(d));
      }
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.showMyItems ? 'My Products' : 'All Products'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchNews(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no football item yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ItemEntryCard(
                  itemEntry: snapshot.data![index],
                  onTap: () {
                    // Show a snackbar when news card is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailPage(
                          itemEntry: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}