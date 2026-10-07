import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ReviewComplaintScreen extends StatelessWidget {
  final String title;
  final String description;
  final XFile? selectedImage;
  final VoidCallback onConfirm;

  const ReviewComplaintScreen({
    super.key,
    required this.title,
    required this.description,
    required this.selectedImage,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Complaint'),
        backgroundColor: const Color(0xFF1554D1),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please review your complaint',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const Text(
              'Complaint Title',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(title),

            const SizedBox(height: 20),

            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),

            if (selectedImage != null) ...[
              const SizedBox(height: 20),

              const Text(
                'Attached Photo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  selectedImage!.path,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],

            const SizedBox(height: 20),
            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: onConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1554D1),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Confirm & Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
