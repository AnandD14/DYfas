import 'package:flutter/material.dart';
import 'product.dart';

class BasketManager extends ChangeNotifier {
  // 1
  final _productItems = <Product>[];

  // 2
  List<Product> get productItems => List.unmodifiable(_productItems);

  // 3
  void deleteItem(int index) {
    _productItems.removeAt(index);
    notifyListeners();
  }

  // 4
  void addItem(Product item) {
    _productItems.add(item);
    notifyListeners();
  }

  // 5
  void updateItem(Product item, int index) {
    _productItems[index] = item;
    notifyListeners();
  }

  // 6
  void completeItem(int index, bool change) {
    final item = _productItems[index];
  //  _productItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}
