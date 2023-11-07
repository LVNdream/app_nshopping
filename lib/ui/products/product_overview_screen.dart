import 'package:flutter/material.dart';
import 'product_grid_tile.dart';
import 'products_grid.dart';
import '../../shared/app_drawer.dart';

enum FilterOptions { favorites, all }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _ShowOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nshopping'),
        actions: <Widget>[buildProductFilterMenu(), buildShoppingCartIcon()],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_ShowOnlyFavorites),
    );
  }

  Widget buildShoppingCartIcon() {
    return IconButton(
      icon: const Icon(
        Icons.shopping_cart,
        color: Color.fromARGB(255, 254, 254, 254),
      ),
      onPressed: () {
        print('Go to cart screen!!!');
      },
    );
  }

  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        setState(() {
          if (selectedValue == FilterOptions.favorites) {
            _ShowOnlyFavorites = true;
          } else {
            _ShowOnlyFavorites = false;
          }
        });
      },
      icon: const Icon(Icons.more_vert),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Only faavorite!'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Show All!'),
        )
      ],
    );
  }
}
