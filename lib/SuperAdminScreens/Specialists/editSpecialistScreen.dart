import 'package:flutter/material.dart';

class EditSpecialistPage extends StatelessWidget {
  final Map<String, String> specialist;
  const EditSpecialistPage({super.key, required this.specialist});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: specialist["name"]);
    final specialtyController =
        TextEditingController(text: specialist["specialty"]);

    return Scaffold(
      appBar: AppBar(title: const Text("تعديل بيانات الأخصائي")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildField("اسم الأخصائي", nameController),
            const SizedBox(height: 15),
            _buildField("التخصص الدقيق", specialtyController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تم تعديل بيانات الأخصائي")),
                );
                Navigator.pop(context);
              },
              child: const Text("حفظ التعديلات"),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تم حذف الأخصائي")),
                );
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
              child: const Text("حذف الأخصائي"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
