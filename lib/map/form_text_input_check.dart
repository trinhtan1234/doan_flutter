import 'package:flutter/material.dart';

class FormTextInputCheck extends StatefulWidget {
  const FormTextInputCheck({super.key});

  @override
  State<FormTextInputCheck> createState() => _FormTextInputCheckState();
}

class _FormTextInputCheckState extends State<FormTextInputCheck> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nhập thông tin kiểm tra'),
      content: TextField(
        decoration: InputDecoration(
          hintText: 'Mô tả',
        ),
      ),
      actions: <Widget>[
        FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cập nhật'),
        ),
      ],
    );
  }
}
