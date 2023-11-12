import 'package:app_nshopping/ui/auth/auth_manager.dart';
import 'package:app_nshopping/ui/auth/auth_screen.dart';
import 'package:app_nshopping/ui/order/order_manager.dart';
import 'package:app_nshopping/ui/order/order_screen.dart';
import 'package:app_nshopping/ui/products/products_detail_screen.dart';
import 'package:app_nshopping/ui/products/products_manager.dart';
import 'package:app_nshopping/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthManager()),
          ChangeNotifierProvider(create: (ctx) => ProductsManager()),
          ChangeNotifierProvider(create: (ctx) => OrdersManager())
        ],
        child: Consumer<AuthManager>(
          builder: (ctx, authManager, child) {
            print("qưeqweqweqwe");
            print(authManager.authToken);
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

              home: authManager.isAuth
                  ? const ProductOverviewScreen()
                  : const AuthScreen(),

              routes: {
                OrdersScreen.routeName: (ctx) => OrdersScreen(
                    authManager.authToken == null ? "" : authManager.emailAuth),
              },
              onGenerateRoute: (settings) {
                if (settings.name == ProductDetailScreen.routeName) {
                  final productId = settings.arguments as String;
                  return MaterialPageRoute(
                    builder: (ctx) {
                      return ProductDetailScreen(
                        ctx.read<ProductsManager>().findById(productId)!,
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
          },
        ));
  }
}
