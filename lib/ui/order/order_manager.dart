import 'package:app_nshopping/services/api_service.dart';
import 'package:flutter/foundation.dart';

import '../../models/order.dart';

class OrdersManager with ChangeNotifier {
  List<Order> _items = [
    // Order(
    //   id_order: "o1",
    //   full_name: "Le Viet Nhut",
    //   date_order: "23-09-12",
    //   address: "123, Xuân Khánh, Ninh Kiều, Cần Thơ",
    //   recvie: "Giao tận nơi",
    //   status_order: "Đang giao",
    //   total_money_order: "2880000",
    //   phone: "2880000",
    //   listItem: [
    //     {
    //       "id_product": 2,
    //       "picture_product":
    //           'https://product.hstatic.net/1000296747/product/16aa9cef0c31825358c2ef1bc969f041_349c4c652a034bde9c996723e2d79690_large.jpeg',
    //       "name_product": 'Áo sweater nam hè thời trang mùa hè',
    //       "price_product": 360000,
    //       "quantity": 1,
    //       "size": 'L',
    //       "color": 'Trắng',
    //       "price_temp": 360000
    //     },
    //     {
    //       "id_product": 3,
    //       "picture_product":
    //           'https://product.hstatic.net/1000296747/product/img_9988_fdf1f35a37f34505b6a8d81dec585608_large.jpg',
    //       "name_product": 'Áo thun basic nam thời trang mùa hè',
    //       "price_product": 360000,
    //       "quantity": 1,
    //       "size": 'L',
    //       "color": 'Be',
    //       "price_temp": 360000
    //     },
    //     {
    //       "id_product": 24,
    //       "picture_product":
    //           'https://product.hstatic.net/1000296747/product/070f4f445f4143b23cd63c02300899f9_064a2b032fe7468e8b9fbfa975ef28a5_large.jpeg',
    //       "name_product": 'Áo khoác Châu Âu',
    //       "price_product": 295000,
    //       "quantity": 1,
    //       "size": 'L',
    //       "color": 'Vàng Be',
    //       "price_temp": 295000
    //     },
    //     {
    //       "id_product": 25,
    //       "picture_product":
    //           'https://product.hstatic.net/1000296747/product/607c626fd5f5c44181d3a12d7a266a53_c85cfdcdfcab472194185ed121c95794_large.jpg',
    //       "name_product": 'Áo khoác hoodie nam thời trang đẹp',
    //       "price_product": 315000,
    //       "quantity": 1,
    //       "size": 'L',
    //       "color": 'Be',
    //       "price_temp": 315000
    //     }
    //   ],
    // ),
    // Order(
    //   id_order: "o3",
    //   full_name: 'Lê Việt Thái',
    //   date_order: '2023-09-18',
    //   address: "",
    //   recvie: "undefined",
    //   status_order: 'Chờ xác nhận',
    //   total_money_order: '2160000',
    //   phone: '0397224191',
    //   listItem: [
    //     {
    //       "id_product": 3,
    //       "picture_product":
    //           'https://product.hstatic.net/1000296747/product/img_9988_fdf1f35a37f34505b6a8d81dec585608_large.jpg',
    //       "name_product": 'Áo thun basic nam thời trang mùa hè',
    //       "price_product": 360000,
    //       "quantity": 4,
    //       "size": 'L',
    //       "color": 'Trắng',
    //       "price_temp": 360000
    //     },
    //     {
    //       "id_product": 3,
    //       "picture_product":
    //           'https://product.hstatic.net/1000296747/product/img_9988_fdf1f35a37f34505b6a8d81dec585608_large.jpg',
    //       "name_product": 'Áo thun basic nam thời trang mùa hè',
    //       "price_product": 360000,
    //       "quantity": 3,
    //       "size": 'L',
    //       "color": 'Xanh',
    //       "price_temp": 360000
    //     },
    //     {
    //       "id_product": 3,
    //       "picture_product":
    //           'https://product.hstatic.net/1000296747/product/img_9988_fdf1f35a37f34505b6a8d81dec585608_large.jpg',
    //       "name_product": 'Áo thun basic nam thời trang mùa hè',
    //       "price_product": 360000,
    //       "quantity": 1,
    //       "size": 'M',
    //       "color": 'Vàng',
    //       "price_temp": 360000
    //     }
    //   ],
    // ),
  ];

Future<void> fetchOrders(email) async {
    _items = (await APIservice.fetchOrders(email))!;
    // print(_items[0].name);
    notifyListeners();
  }
  int get orderCount {
    return _items.length;
  }

  List<Order> get orders {
    return [..._items];
  }
}
