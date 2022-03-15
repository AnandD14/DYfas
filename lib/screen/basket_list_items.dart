import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '/Model/models.dart';

class BasketItemScreen extends StatefulWidget {
  // 1
  final Function(Product) onCreate;
  // 2
  final Function(Product) onUpdate;
  // 3
  final Product? originalItem;
  // 4
  final bool isUpdating;

  const BasketItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  _BasketItemScreen createState() => _BasketItemScreen();
}

class _BasketItemScreen extends State<BasketItemScreen> {
  // TODO: Add grocery item screen state properties

  @override
  Widget build(BuildContext context) {
    // TODO 12: Add GroceryItemScreen Scaffold
    return Container(color: Colors.orange);
  }

  @override
  void initState() {
    super.initState();
    // 1
    final originalItem = widget.originalItem;
    /*if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    // 2
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });*/
  }


}
