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
      title: const Text('Nhập thông tin kiểm tra'),
      content: const TextField(
        decoration: InputDecoration(
          hintText: 'Mô tả',
          icon: Icon(Icons.record_voice_over),
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: 80,
          child: FloatingActionButton(
            backgroundColor: Colors.brown,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cập nhật',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
