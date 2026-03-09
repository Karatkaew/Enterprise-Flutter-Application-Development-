import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';


class MLKitDatasource {

  final textRecognizer = TextRecognizer();

  Future<String> extractText(File image) async {

    final inputImage = InputImage.fromFile(image);

    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    return recognizedText.text;
  }
}