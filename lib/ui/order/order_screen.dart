import 'dart:math';

// import 'package:delivery_fastfood_app/shared/app_drawer.dart';
import 'package:app_nshopping/models/auth_token.dart';
import 'package:app_nshopping/ui/auth/auth_manager.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'order_item_card.dart';
import 'order_manager.dart';
// import '../products/product_overview_screen.dart';
import '../../shared/app_drawer.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';
  final String email;

  const OrdersScreen(this.email, {super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    print('building orders!!');
    final ordersManager = OrdersManager();

    print(widget.email);
    // final authManager = AuthManager();
    // widget.email == null ? print("da nulllll") : print(widget.email);

    return Scaffold(
        // drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text('My Orders'),
        ),
        drawer: const AppDrawer(),
        body: ordersManager.orderCount == 0
            ? Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Bạn chưa có đơn hàng nào, vui lòng đến giở hàng để thêm đơn hàng!',
                  style: TextStyle(fontSize: 20, color: Colors.red.shade800),
                ),
              )
            : ListView.builder(
                itemCount: ordersManager.orderCount,
                itemBuilder: (ctx, i) => OrderItemCard(
                  ordersManager.orders[i],
                ),
              ));
  }
}
