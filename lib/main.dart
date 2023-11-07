import 'package:app_nshopping/ui/order/order_screen.dart';
import 'package:app_nshopping/ui/products/products_detail_screen.dart';
import 'package:app_nshopping/ui/products/products_manager.dart';
import 'package:flutter/material.dart';
import 'ui/products/product_overview_screen.dart';
import 'ui/products/user_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nshopping',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        primarySwatch: Colors.brown,
      ),
      // home: Scaffold(
      //   appBar: AppBar(title: const Text("Nshopping")),
      //   body: const Center(
      //     child: Text("Welcome to Nshopping"),
      //   ),
      // ),

      //
      //  home: SafeArea(
      //     child: ProductDetailScreen(ProductsManager().items[0])
      //   ),

      home: const ProductOverviewScreen(),
      routes: {
        OrdersScreen.routeName: (ctx) => const OrdersScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailScreen.routeName) {
          final productId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (ctx) {
              return ProductDetailScreen(
                ProductsManager().findById(productId)!,
              );
            },
          );
        }
        return null;
      },

      // home: SafeArea(
      //   child: OrdersScreen(),
      // ),

      // home: const SafeArea(
      //   child: UserProductsScreen(),
      // ),
    );
  }
}
