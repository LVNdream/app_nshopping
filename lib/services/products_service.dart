// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../ui/products/product_grid_tile.dart';
// import '../models/product.dart';

// class ProductsService {
//   Future<List<Product>> fetchProducts() async {
//     final List<Product> products = [];

//     try {
//       final productsUrl = Uri.parse('http://localhost:3001/products/men');
//       final response = await http.get(productsUrl);
//       print("dsđsdsdsds");

//       print(response);

//       final productsMap = json.decode(response.body) as Map<String, dynamic>;

//       if (response.statusCode != 200) {
//         print(productsMap['error']);
//         return products;
//       }
//       productsMap.forEach(
//         (productId, product) {
//           products.add(
//             Product.fromJson(
//               {
//                 ...product,
//               },
//             ).copyWith(),
//           );
//         },
//       );
//       return products;
//     } catch (error) {
//       print(error);
//       return products;
//     }
//   }
// }
