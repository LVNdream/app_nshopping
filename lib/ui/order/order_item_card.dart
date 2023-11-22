import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/order.dart';

class OrderItemCard extends StatefulWidget {
  final Order order;
  const OrderItemCard(this.order, {super.key});

  @override
  State<OrderItemCard> createState() => _OrderItemCard();
}

class _OrderItemCard extends State<OrderItemCard> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildOrderSummary(),
          if (_expanded)
            Container(
              child: Column(
                children: [
                  Text(
                    "Chi Tiết đơn hàng",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(222, 71, 36, 13)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildOrderDetails()
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget buildOrderDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      height: 270,
      child: ListView(
          children: widget.order.listItem
              .map(
                (prod) =>
                    // print("adss");
                    Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(left: 10),
                      child: Text(
                        prod["name_product"],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 81, 81, 81)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CircleAvatar(
                              radius: 48,
                              backgroundImage:
                                  NetworkImage(prod["picture_product"])),
                        ),
                        Text(
                          'Size: ${prod["size"]}, ${prod["quantity"]} x ${prod["price_temp"]}vnd',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: SizedBox(
                          height: 2,
                          width: 500,
                          child: ElevatedButton(
                              child: Text(""),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.redAccent,
                                  elevation: 10,
                                  minimumSize: Size(200, 200)))),
                    )
                  ],
                ),
              )
              .toList()),
    );
  }

  Widget buildOrderSummary() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Text(
                '${widget.order.full_name}',
                style: TextStyle(
                  color: Color.fromARGB(255, 87, 25, 20),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              )),
              Container(
                child: IconButton(
                  icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Container(
                child: Text(
                  textAlign: TextAlign.left,
                  "Ngày mua: ${widget.order.date_order}",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Container(
                child: Text(
                  textAlign: TextAlign.left,
                  "Số điện thoại: ${widget.order.phone}",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            child: Text(
              textAlign: TextAlign.left,
              widget.order.address != ""
                  ? "Địa chỉ giao : ${widget.order.address}"
                  : "Nhận tại của hàng",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            child: Text(
              textAlign: TextAlign.left,
              "Trạng Thái đơn hàng : ${widget.order.status_order}",
              style: TextStyle(
                color: Color.fromARGB(255, 22, 43, 176),
                fontSize: 19,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              textAlign: TextAlign.left,
              "Tổng tiền : ${widget.order.total_money_order}",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 0, 0),
                fontSize: 22,
              ),
            ),
          )
        ],
      ),
    );
  }
}
