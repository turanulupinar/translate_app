import 'package:flutter/material.dart';
import 'package:translate_app/util/textstyle_validator.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  const CustomDropDownWidget({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.itembuild,
    this.hintText = "sec",
  });

  final List<T> items;
  final T? selectedValue;
  final ValueChanged<T?> onChanged;
  final String Function(T) itembuild;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<T>(
        isExpanded: true,
        value: selectedValue,
        hint: Center(
            child: Text(
          hintText,
          style: TextStyleValidator()
              .getStyleValidator(fontName: "Medium", fontsize: 14),
        )),
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Center(
              child: Text(
                itembuild(item),
                style: TextStyleValidator()
                    .getStyleValidator(fontName: "Medium", fontsize: 14),
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
