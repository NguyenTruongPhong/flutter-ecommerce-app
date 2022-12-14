import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.imageUrl,
    required this.name,
  });

  Map<String, dynamic> toSnapshot() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory Category.fromSnapshot(DocumentSnapshot snapshot) {
    return Category(
      name: snapshot['name'] as String,
      imageUrl: snapshot['imageUrl'] as String,
    );
  }

  // static const List<Category> categories = [
  //   Category(
  //     name: 'SoftDrinks',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1534057308991-b9b3a578f1b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/5lZhD2qQ2SE
  //   ),
  //   Category(
  //     name: 'Smoothies',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1502741224143-90386d7f8c82?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/m741tj4Cz7M
  //   ),
  //   Category(
  //     name: 'Water',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1559839914-17aae19cec71?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/7Zlds3gm7NU
  //   ),
  // ];

  @override
  List<Object?> get props => [name, imageUrl];
}
