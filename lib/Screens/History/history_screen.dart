import 'package:flutter/material.dart';
import 'package:nivra/models/complaint.dart';
import 'package:nivra/Screens/Complaint/complaint_details_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaint History'),
        backgroundColor: const Color(0xFF1554D1),
        foregroundColor: Colors.white,
      ),
      body: ComplaintStore.complaints.isEmpty
          ? const Center(child: Text('No complaints submitted yet.'))
          : ListView.builder(
              itemCount: ComplaintStore.complaints.length,
              itemBuilder: (context, index) {
                final complaint = ComplaintStore.complaints[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(complaint.title),
                    subtitle: Text(complaint.description),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                       context,
                       MaterialPageRoute(
                       builder: (context) => ComplaintDetailsScreen(complaint: complaint),
      ),
    );
  },
                  ),
                );
              },
            ),
    );
  }
}
