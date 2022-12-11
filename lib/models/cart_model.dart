import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

class Cart extends Equatable {
  const Cart({this.products = const <Product>[]});

  final List<Product> products;

  Map productQuantity() {
    var quantity = {};
    for (var product in products) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    }
    return quantity;
  }

  double get _subtotal {
    return products.fold(0, (subtotal, product) => subtotal += product.price);
  }

  double _deliveryFee(double subtotal) {
    if (subtotal >= 30) {
      return 0;
    } else {
      return 10;
    }
  }

  double _total(double subtotal, double deliveryFee) {
    return subtotal + deliveryFee;
  }

  String _freeDelivery(double subtotal) {
    if (subtotal >= 30) {
      return 'You have FREE Delivery.';
    } else {
      double missing = 30 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery.';
    }
  }

  String get subTotalString => _subtotal.toStringAsFixed(2);

  String get deliveryFeeString => _deliveryFee(_subtotal).toStringAsFixed(2);

  String get freeDeliveryString => _freeDelivery(_subtotal);

  String get totalString =>
      _total(_subtotal, _deliveryFee(_subtotal)).toStringAsFixed(2);

  // static const List<ProductModel> products = [
  //   ProductModel(
  //     id: '1',
  //     name: 'Soft Drink #1',
  //     category: 'Soft Drinks',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   ProductModel(
  //     id: '2',
  //     name: 'Soft Drink #2',
  //     category: 'Soft Drinks',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
  //     price: 2.99,
  //     isRecommended: false,
  //     isPopular: true,
  //   ),
  //   ProductModel(
  //     id: '3',
  //     name: 'Soft Drink #3',
  //     category: 'Soft Drinks',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: true,
  //   ),
  //   ProductModel(
  //     id: '4',
  //     name: 'Smoothies #1',
  //     category: 'Smoothies',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/kcYXj4tBtes
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   ProductModel(
  //     id: '5',
  //     name: 'Smoothies #2',
  //     category: 'Smoothies',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
  //     price: 2.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   ProductModel(
  //     id: '6',
  //     name: 'Soft Drink #1',
  //     category: 'Soft Drinks',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   ProductModel(
  //     id: '7',
  //     name: 'Soft Drink #2',
  //     category: 'Soft Drinks',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
  //     price: 2.99,
  //     isRecommended: false,
  //     isPopular: true,
  //   ),
  //   ProductModel(
  //     id: '8',
  //     name: 'Soft Drink #3',
  //     category: 'Soft Drinks',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: true,
  //   ),
  //   ProductModel(
  //     id: '9',
  //     name: 'Smoothies #1',
  //     category: 'Smoothies',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/kcYXj4tBtes
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   ProductModel(
  //     id: '10',
  //     name: 'Smoothies #2',
  //     category: 'Smoothies',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
  //     price: 2.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   ProductModel(
  //     id: '11',
  //     name: 'Soft Drink #1',
  //     category: 'Soft Drinks',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   ProductModel(
  //     id: '12',
  //     name: 'Soft Drink #2',
  //     category: 'Soft Drinks',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
  //     price: 2.99,
  //     isRecommended: false,
  //     isPopular: true,
  //   ),
  //   ProductModel(
  //     id: '13',
  //     name: 'Soft Drink #3',
  //     category: 'Soft Drinks',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
  //     price: 2.99,
  //     isRecommended: true,
  //     isPopular: true,
  //   ),
  //   ProductModel(
  //     id: '14',
  //     name: 'Smoothies #2',
  //     category: 'Smoothies',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
  //     price: 2.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  // ];

  @override
  List<Object?> get props => [products];
}
