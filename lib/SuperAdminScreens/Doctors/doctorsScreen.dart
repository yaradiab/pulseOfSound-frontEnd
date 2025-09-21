import 'package:flutter/material.dart';
import '../../Colors/colors.dart';
import 'addDoctorScreen.dart';
import 'editDoctorScreen.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //(     backend)
    final doctors = [
      {"name": "د. أحمد"},
      {"name": "د. سارة"},
      {"name": "د. محمد"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("الأطباء"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            color: AppColors.babyBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: AppColors.skyBlue.withOpacity(0.2),
                radius: 28,
                child: const Icon(Icons.person, color: AppColors.skyBlue),
              ),
              title: Text(
                doctor["name"]!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditDoctorPage(
                        doctor: doctor,
                        name: '',
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.skyBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddDoctorPage()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
