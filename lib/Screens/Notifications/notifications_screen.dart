import 'package:flutter/material.dart';
import 'package:nivra/models/complaint.dart';
import 'package:nivra/Screens/Status/complaint_details_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xFF1554D1),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFEDF3FF),
                child: Icon(Icons.assignment, color: Color(0xFF1554D1)),
              ),
              title: const Text(
                'Complaint Submitted',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Your complaint has been submitted successfully.',
              ),
              onTap: () {
                if (ComplaintStore.complaints.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No complaint available')),
                  );
                  return;
                }

                final complaint = ComplaintStore.complaints.last;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ComplaintDetailsScreen(complaint: complaint),
                  ),
                );
              },

              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE8F5E9),
                child: Icon(Icons.check_circle, color: Colors.green),
              ),
              title: const Text(
                'Complaint Resolved',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Your complaint has been resolved.'),
              onTap: () {
                if (ComplaintStore.complaints.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No complaint available')),
                  );
                  return;
                }

                final complaint = ComplaintStore.complaints.last;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ComplaintDetailsScreen(complaint: complaint),
                  ),
                );
              },
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFFFF3E0),
                child: Icon(Icons.info_outline, color: Colors.orange),
              ),
              title: const Text(
                'Status Update',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Your complaint status has been updated.'),
              onTap: () {
                if (ComplaintStore.complaints.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No complaint available')),
                  );
                  return;
                }

                final complaint = ComplaintStore.complaints.last;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ComplaintDetailsScreen(complaint: complaint),
                  ),
                );
              },
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
