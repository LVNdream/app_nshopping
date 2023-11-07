class Order {
  final String id_order;
  final String full_name;
  final String date_order;
  final String address;
  final String recvie;
  final String status_order;
  final String total_money_order;
  final String phone;
  final List<Map<dynamic,dynamic>> listItem;
  Order({
    required this.id_order,
    required this.full_name,
    required this.date_order,
    required this.address,
    required this.recvie,
    required this.status_order,
    required this.total_money_order,
    required this.phone,
    required this.listItem,
  });
  Order copyWith({String? id, String? title, int? quantity, double? price}) {
    return Order(
      id_order: id_order ?? this.id_order,
      full_name: full_name ?? this.full_name,
      date_order: date_order ?? this.date_order,
      address: address ?? this.address,
      recvie: recvie ?? this.recvie,
      status_order: status_order ?? this.status_order,
      total_money_order: total_money_order ?? this.total_money_order,
      phone: phone ?? this.phone,
      listItem: listItem ?? this.listItem,
    );
  }
}
