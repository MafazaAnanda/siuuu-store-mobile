import 'dart:convert';

List<ItemEntry> itemEntryFromJson(String str) => List<ItemEntry>.from(json.decode(str).map((x) => ItemEntry.fromJson(x)));

String itemEntryToJson(List<ItemEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemEntry {
    String id;
    String name;
    String description;
    String category;
    String thumbnail;
    bool isFeatured;
    int stock;
    int price;
    String brand;
    int userId;
    String userUsername;
    bool isTrusted;

    ItemEntry({
        required this.id,
        required this.name,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.isFeatured,
        required this.stock,
        required this.price,
        required this.brand,
        required this.userId,
        required this.userUsername,
        required this.isTrusted,
    });

    factory ItemEntry.fromJson(Map<String, dynamic> json) => ItemEntry(
        id: json["id"]?.toString() ?? "",
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        category: json["category"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
        isFeatured: json["is_featured"] ?? false,
        stock: json["stock"] ?? 0,
        price: json["price"] ?? 0,
        brand: json["brand"] ?? "",
        userId: json["user_id"] ?? 0,
        userUsername: json["user_username"] ?? "",
        isTrusted: json["is_trusted"] ?? false,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "stock": stock,
        "price": price,
        "brand": brand,
        "user_id": userId,
        "user_username": userUsername,
        "is_trusted": isTrusted,
    };
}