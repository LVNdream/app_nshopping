import 'dart:convert';
import 'dart:math';

import 'package:app_nshopping/config.dart';
import 'package:app_nshopping/models/auth_token.dart';
import 'package:app_nshopping/models/order.dart';
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

  static Future<AuthToken?> checkLogin(email, password) async {
    // print("adasdasd");
    final Map<dynamic, dynamic> authToken = {};

    try {
      Map<String, String> requestHearders = {
        'Content-Type': 'application/json'
      };
      var url = Uri.http(Config.apiURL, Config.apiLoginURL);
      var response = await client
          .post(url, headers: requestHearders, body: {email, password});
      if (response.statusCode == 200) {
        final auth = json.decode(response.body) as Map<dynamic, dynamic>;
        print(auth);

        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  static Future<List<Order>?> fetchOrders(email) async {
    // print("adasdasd");
    final List<Order> allorders = [];

    try {
      Map<String, String> requestHearders = {
        'Content-Type': 'application/json'
      };
      var url =
          Uri.http(Config.apiURL, Config.apiGetOrderURL, {'email_user': email});
      var response = await client.get(url, headers: requestHearders);
      if (response.statusCode == 200) {
        final OrdersMap = json.decode(response.body) as List<dynamic>;

        OrdersMap.forEach(
          (order) {
            print("cascsac");
            // if (order["recvie"] == null) {
            //   order["recvie"] = "";
            // }
            // order["listItem"] =
            //     order["listItem"] as List<Map<dynamic, dynamic>>;
            // print(order);

            // print(order["listItem"]);

            allorders.add(
              Order.fromJson(
                {
                  'id_order': order['id_order'].toString(),
                  'full_name': order['fullname'],
                  'date_order': order['date_order'],
                  'address': order['adress'],
                  'recvie': order['recvie'],
                  'status_order': order['status_order'],
                  'total_money_order': order['total_money_order'].toString(),
                  'phone': order['phone'].toString(),
                  'listItem': order['listItem'],
                },
              ),
            );
          },
        );
        // print("allorders");

        print(allorders);
        return allorders;
      }
    } catch (error) {
      print(error);
      return allorders;
    }
  }
}
