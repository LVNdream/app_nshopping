// import 'package:delivery_fastfood_app/constants/color.dart';
// import 'package:delivery_fastfood_app/screens/auth/auth_manager.dart';
// import 'package:delivery_fastfood_app/screens/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:myshop/ui/auth/auth_manager.dart';
// import 'package:provider/provider.dart';

import '../ui/order/order_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // _buildHeader(context),
              _buildMenuItems(context),
            ]),
      ),

      //   children: <Widget>[
      //     AppBar(
      //       title: const Text('Viet Nhut'),
      //       automaticallyImplyLeading: false,
      //     ),
      //     const Divider(),
      //     ListTile(
      //       leading: const Icon(Icons.shop),
      //       title: const Text('Home Page'),
      //       onTap: () {
      //         Navigator.of(context)..pushReplacementNamed('/');
      //         // context.read<AuthManager>().logout();
      //       },
      //     ),
      //     const Divider(),
      //     ListTile(
      //       leading: const Icon(Icons.payment),
      //       title: const Text('Your\'s Orders'),
      //       onTap: () {
      //         Navigator.of(context)
      //             .pushReplacementNamed(OrdersScreen.routeName);
      //       },
      //     ),
      //     // const Divider(),
      //     // ListTile(
      //     //   leading: const Icon(Icons.edit),
      //     //   title: const Text('Manage Products'),
      //     //   onTap: () {
      //     //     Navigator.of(context)
      //     //         .pushReplacementNamed(UserProductsScreen.routeName);
      //     //   },
      //     // ),
      //   ],
      // ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 255, 123, 0),
              size: 30,
            ),
            title: const Text(
              'Home Page',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: const Icon(
              Icons.payment_outlined,
              color: Color.fromARGB(255, 255, 123, 0),
              size: 30,
            ),
            title: const Text(
              'My order',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_outlined,
              color: Color.fromARGB(255, 255, 123, 0),
              size: 30,
            ),
            title: const Text(
              'Notifications',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
