import 'package:app_nshopping/services/api_service.dart';

import '../../services/products_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import '../../models/product.dart';

class ProductsManager with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   name: "Ao khoac nam thoi trang cuc dep",
    //   price: 240000,
    //   imageUrl:
    //       'https://product.hstatic.net/1000296747/product/bd5c4affd1188d6456a393fc05bf4503_2b9dcd6c0ba7427f991aec5310bd10c4_large.jpeg',
    // ),
    // Product(
    //   id: 'p2',
    //   name: "Ao khoac nam thoi trang cuc dep",
    //   price: 310000,
    //   imageUrl:
    //       'https://product.hstatic.net/1000296747/product/2a005366a09a7174f8e91b15d67486c2_9c914316a42f4cc5a6a5775370e23410_large.jpeg',
    // ),
    // Product(
    //   id: 'p3',
    //   name: "Ao khoac nam thoi trang cuc dep",
    //   price: 503100,
    //   imageUrl:
    //       'https://product.hstatic.net/1000296747/product/22d4032ca55e61dbf0cb07f25817a975_6dbf98f06e4940b487a00aa2fd48072a_large.jpeg',
    // ),
    // Product(
    //   id: 'p4',
    //   name: "Ao khoac nam thoi trang cuc dep",
    //   price: 180000,
    //   imageUrl:
    //       'https://product.hstatic.net/1000296747/product/8d5532ef0f3e8e59691c1ce44c911304_1612148b6887401d87d5a37a763cfd47_large.jpeg',
    // ),
  ];

  Future<void> fetchProducts() async {
    _items = (await APIservice.fetchProducts())!;
    // print(_items[0].name);
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  Product? findById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (error) {
      return null;
    }
  }
}
