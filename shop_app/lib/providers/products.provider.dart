import 'package:flutter/widgets.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get getFavorItems {
    return [...items].where((item) => item.isFavored == true).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> getProducts() async {
    try {
      final url = Uri.parse(
          'https://flutter-shop-app-23df4-default-rtdb.firebaseio.com/products.json');

      final result = await http.get(url);
      final extractedData = json.decode(result.body);
      final List<Product> loadedProducts = [];
      extractedData.forEach((productId, productData) {
        loadedProducts.add(Product(
            id: productId,
            title: productData['title'],
            description: productData['description'],
            imageUrl: productData['imageUrl'],
            price: productData['price'],
            isFavored: productData['isFavorite']));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> addProduct(title, description, imageUrl, price) async {
    try {
      final url = Uri.parse(
          'https://flutter-shop-app-23df4-default-rtdb.firebaseio.com/products.json');

      final response = await http.post(url,
          body: json.encode({
            'title': title,
            'description': description,
            'price': price,
            'imageUrl': imageUrl,
            'isFavorite': false
          }));

      _items.add(Product(
        id: json.decode(response.body)['name'],
        description: description,
        title: title,
        price: price,
        imageUrl: imageUrl,
        isFavored: false,
      ));

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(id, editProduct) async {
    final url = Uri.parse(
        'https://flutter-shop-app-23df4-default-rtdb.firebaseio.com/products/${id}.json');

    await http.patch(
      url,
      body: json.encode({
        'title': editProduct.title,
        'description': editProduct.description,
        'imageUrl': editProduct.imageUrl,
        'price': editProduct.price,
      }),
    );

    final productIndex = items.indexWhere((product) => product.id == id);
    _items[productIndex] = Product(
      id: id,
      title: editProduct.title,
      description: editProduct.description,
      imageUrl: editProduct.imageUrl,
      price: editProduct.price,
    );
    notifyListeners();
  }

  Future<void> deleteProduct(id) async {
    final url = Uri.parse(
        'https://flutter-shop-app-23df4-default-rtdb.firebaseio.com/products/${id}.json');

    final readyToDeleteIndex = _items.indexWhere((element) => element.id == id);
    // Save a copy of deleteItem before doing async operation to reverse the change in case it fails
    var deleteItem = _items[readyToDeleteIndex];

    _items.removeAt(readyToDeleteIndex);
    notifyListeners();

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      _items.insert(readyToDeleteIndex, deleteItem);
      notifyListeners();

      throw Exception('Cant delete the item for some reasons');
    } else {
      // Assign this item as null so Flutter will remove this since operation is success and we don't need this reference
      // in the case it fails any longer
      deleteItem = null;
    }

    notifyListeners();
  }
}
