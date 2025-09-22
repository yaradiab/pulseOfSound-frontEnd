import 'package:flutter/material.dart';
import '../../Colors/colors.dart';

import 'addSpecialistScreen.dart';
import 'editSpecialistScreen.dart';

class SpecialistsPage extends StatelessWidget {
  const SpecialistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final specialists = [
      {"name": "أ. ريم", "specialty": "علاج نطق"},
      {"name": "أ. خالد", "specialty": "علاج سمعي"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("الأخصائيين"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: specialists.length,
        itemBuilder: (context, index) {
          final specialist = specialists[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: AppColors.pink.withOpacity(0.2),
                radius: 28,
                child: const Icon(Icons.person, color: AppColors.pink),
              ),
              title: Text(
                specialist["name"]!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                specialist["specialty"]!,
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          EditSpecialistPage(specialist: specialist),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.pink,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddSpecialistPage()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
