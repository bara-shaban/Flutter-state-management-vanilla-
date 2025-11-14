// ignore_for_file: public_member_api_docs

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_mangement_101/models/product.dart';

const List<Product> allProducts = [
  Product(
    id: '1',
    title: 'Groovy Shorts',
    price: 12,
    image: 'assets/products/shorts.png',
  ),
  Product(
    id: '2',
    title: 'Denim Jeans',
    price: 34,
    image: 'assets/products/jeans.png',
  ),
  Product(
    id: '3',
    title: 'Red Backpack',
    price: 54,
    image: 'assets/products/backpack.png',
  ),
  Product(
    id: '4',
    title: 'Drum & Sticks',
    price: 29,
    image: 'assets/products/drum.png',
  ),
  Product(
    id: '5',
    title: 'Blue Suitcase',
    price: 44,
    image: 'assets/products/suitcase.png',
  ),
  Product(
    id: '6',
    title: 'Roller Skates',
    price: 19,
    image: 'assets/products/skates.png',
  ),
  Product(
    id: '7',
    title: 'karati Kit',
    price: 34,
    image: 'assets/products/karati.png',
  ),
  Product(
    id: '8',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/guitar.png',
  ),
];

final productsProvider = Provider<List<Product>>(
  (ref) {
    return allProducts;
  },
);

final reducedProductsProvider = Provider<List<Product>>(
  (ref) {
    return allProducts.where((product) => product.price < 50).toList();
  },
);
