import 'package:flutter/material.dart';

class RulesDropdown extends StatelessWidget {
  final List<String> items;
  final String selectedValue;
  final Function(String?) onChanged;

  const RulesDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      underline: Container(),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
    );
  }
}
