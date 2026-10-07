import 'package:flutter/material.dart';
import 'package:nivra/models/complaint.dart';
import 'package:nivra/Screens/Status/complaint_details_screen.dart';

class ComplaintStatusScreen extends StatelessWidget {
  const ComplaintStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final complaints = ComplaintStore.complaints;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaint Status'),
        backgroundColor: const Color(0xFF1554D1),
        foregroundColor: Colors.white,
      ),
      body: complaints.isEmpty
          ? const Center(child: Text('No complaints submitted yet.'))
          : ListView.builder(
              itemCount: complaints.length,
              itemBuilder: (context, index) {
                final complaint = complaints[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(
                      Icons.assignment,
                      color: Color(0xFF1554D1),
                    ),
                    title: Text(complaint.title),
                    subtitle: Text('Submitted: ${complaint.submittedAt}'),
                    trailing: Chip(
                      backgroundColor: complaint.status == 'Resolved'
                          ? Colors.green.shade100
                          : complaint.status == 'In Progress'
                          ? Colors.blue.shade100
                          : complaint.status == 'Pending'
                          ? Colors.orange.shade100
                          : Colors.grey.shade200,
                      label: Text(
                        complaint.status,
                        style: TextStyle(
                          color: complaint.status == 'Resolved'
                              ? Colors.green
                              : complaint.status == 'In Progress'
                              ? Colors.blue
                              : complaint.status == 'Pending'
                              ? Colors.orange
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ComplaintDetailsScreen(complaint: complaint),
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
