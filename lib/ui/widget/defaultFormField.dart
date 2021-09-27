import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  Function onSubmit;
  Function onChange;
  Function onTap;
  IconData suffix;
  Function suffixPressed;
  Function validate;
  @required String label;
  @required IconData prefix;
  bool isClickable = true;

  CustomFormField(
      {this.controller,
      this.type,
      this.onSubmit,
      this.onChange,
      this.suffix,
      this.prefix,
      this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      enabled: isClickable,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefix),
          border: OutlineInputBorder()),
    );
  }
}
