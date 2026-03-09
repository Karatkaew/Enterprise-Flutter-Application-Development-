import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/expense_bloc.dart';

class ScanReceiptPage extends StatefulWidget {

  const ScanReceiptPage({super.key});

  @override
  State<ScanReceiptPage> createState() => _ScanReceiptPageState();
}

class _ScanReceiptPageState extends State<ScanReceiptPage> {

  final picker = ImagePicker();

  Future<void> scanReceipt() async {

    final image = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (image == null) return;

    final file = File(image.path);

    // mock OCR text (ตอนนี้จำลองก่อน)
    const text = "TOTAL 128.40";

    context.read<ExpenseBloc>().add(
      ScanReceiptEvent(text),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Receipt"),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: scanReceipt,
          child: const Text("Scan Receipt"),
        ),
      ),
    );
  }
}