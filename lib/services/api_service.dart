import 'dart:convert';

import 'package:app_nshopping/config.dart';
import 'package:app_nshopping/models/product.dart';
import 'package:http/http.dart' as http;

class APIservice {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    // print("adasdasd");
    final List<Product> products = [];

    try {
      Map<String, String> requestHearders = {
        'Content-Type': 'application/json'
      };
      var url = Uri.http(Config.apiURL, Config.aproductURL);
      var response = await client.get(url, headers: requestHearders);
      if (response.statusCode == 200) {
        final productsMap = json.decode(response.body) as List<dynamic>;
        // print(productsMap[1]);

        // print(productsMap[1].id_product);
        // print(productsMap[1].name_product);

        // print(productsMap[1].price_product);

        // print(productsMap[1].picture_product);

        productsMap.forEach(
          (product) {
            // print(product);
            products.add(
              Product.fromJson(
                {
                  'id': product['id_product'].toString(),
                  'name': product['name_product'],
                  'price': product['price_product'],
                  'imageUrl': product['picture_product'],
                },
              ),
            );
          },
        );
        // print(products[0].name);
        return products;
      }
    } catch (error) {
      print(error);
      return products;
    }
  }
}
