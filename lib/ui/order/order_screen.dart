import 'dart:math';

// import 'package:delivery_fastfood_app/shared/app_drawer.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'order_item_card.dart';
import 'order_manager.dart';
// import '../products/product_overview_screen.dart';
import '../../shared/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building orders!!');
    final ordersManager = OrdersManager();
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
