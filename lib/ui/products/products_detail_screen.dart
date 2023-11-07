import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductDetailScreen extends StatelessWidget {

  static const routeName = '/productDetail';
  const ProductDetailScreen(
    this.product, {
    super.key,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('Price:',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 250, 0, 0),
                        fontSize: 25,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('${product.price}vnd',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 250, 0, 0),
                        fontSize: 25,
                      )),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
              margin: EdgeInsets.only(left: 20),
              width: double.infinity,
              child: Text(
                "Thông tin chi tiết",
                textAlign: TextAlign.left,
                softWrap: true,
                style: TextStyle(fontSize: 20),
              )),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              "https://file.hstatic.net/1000296747/file/8060_caa7d7c07e1a49439caadf44280ec59b_1024x1024.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              // width: double.infinity,
              child: Text(
                "- Vui lòng tham khảo và so sánh với số đo áo hoặc quần của bạn để chọn được size phù hợp nhất",
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 16),
              )),
          SizedBox(height: 10),
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              // width: double.infinity,
              child: Text(
                "- Hình ảnh được chụp 100% từ sản phẩm thật, dưới ánh sáng tự nhiên và không qua chỉnh sửa để đảm bảo màu sắc trung thực nhất có thể (không tránh khỏi sai lệch từ 10-20% do thiết bị hiển thị).",
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 16),
              )),
        ],
      )),
    );
  }
}
