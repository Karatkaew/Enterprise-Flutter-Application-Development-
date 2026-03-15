import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../routes/app_router.dart';
import 'package:provider/provider.dart';
import '../../../../providers/theme_provider.dart';

@RoutePage()
class ScanReceiptPage extends StatefulWidget {
  const ScanReceiptPage({super.key});

  @override
  State<ScanReceiptPage> createState() => _ScanReceiptPageState();
}

class _ScanReceiptPageState extends State<ScanReceiptPage> {

  File? imageFile;
  String scannedText = "";
  String totalAmount = "";
  bool isLoading = false;

  final picker = ImagePicker();
  final textRecognizer = TextRecognizer();

  Future<void> scanReceipt() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.camera);

    await _processPickedImage(pickedImage);
  }

  Future<void> scanFromGallery() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    await _processPickedImage(pickedImage);
  }

  Future<void> _processPickedImage(XFile? pickedImage) async {
    if (pickedImage == null) return;

    setState(() {
      isLoading = true;
    });

    imageFile = File(pickedImage.path);

    final inputImage = InputImage.fromFile(imageFile!);

    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    String text = recognizedText.text;

    String total = extractTotal(text);

    setState(() {
      scannedText = text;
      totalAmount = total;
      isLoading = false;
    });
  }

  String extractTotal(String text) {

    RegExp regExp = RegExp(r'(\d+\.\d{2})');

    Iterable<Match> matches = regExp.allMatches(text);

    if (matches.isNotEmpty) {
      return matches.last.group(0) ?? "";
    }

    return "Not found";
  }

  @override
  void dispose() {
    textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Receipt"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            /// Receipt Preview
            if (imageFile != null)
              Hero(
                tag: "receiptImage",
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      imageFile!,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            else
              Column(
                children: const [
                  Icon(
                    Icons.receipt_long,
                    size: 120,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Scan your receipt",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Take a photo of your receipt to extract the total amount.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

            const SizedBox(height: 30),

            /// Scan Buttons
            SizedBox(
              height: 55,
              child: ElevatedButton.icon(
                onPressed: isLoading ? null : scanReceipt,
                icon: const Icon(Icons.camera_alt),
                label: const Text("Open Camera"),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 55,
              child: ElevatedButton.icon(
                onPressed: isLoading ? null : scanFromGallery,
                icon: const Icon(Icons.photo_library),
                label: const Text("Scan from Gallery"),
              ),
            ),

            const SizedBox(height: 25),

            /// Loading
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),

            /// Total Amount
            if (totalAmount.isNotEmpty)
              Card(
                color: Colors.teal.shade50,
                child: ListTile(
                  leading: const Icon(
                    Icons.attach_money,
                    color: Colors.teal,
                  ),
                  title: const Text("Total Amount"),
                  subtitle: Text(
                    totalAmount,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 20),

            /// OCR Text Result
            if (scannedText.isNotEmpty)
              ExpansionTile(
                title: const Text("View scanned text"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(scannedText),
                  )
                ],
              ),

            const SizedBox(height: 20),

            /// Go to Detail Page
            if (imageFile != null)
              ElevatedButton(
                onPressed: () {
                  context.router.push(
                    ExpenseDetailRoute(
                      imagePath: imageFile!.path,
                    ),
                  );
                },
                child: const Text("Open Detail"),
              ),
          ],
        ),
      ),
    );
  }
}