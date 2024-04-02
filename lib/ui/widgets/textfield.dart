import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyTextField extends StatelessWidget {
  final Function(String) onChanged;
  const EmptyTextField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
