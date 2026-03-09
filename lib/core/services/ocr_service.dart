import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'dart:io';

class OCRService {

  Future<String> scan(File file) async {

    final recognizer = TextRecognizer();
    final input = InputImage.fromFile(file);

    final result = await recognizer.processImage(input);

    return result.text;
  }

}