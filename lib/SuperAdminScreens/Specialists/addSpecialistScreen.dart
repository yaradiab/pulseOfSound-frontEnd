import 'package:flutter/material.dart';

class AddSpecialistPage extends StatelessWidget {
  const AddSpecialistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    final specialtyController = TextEditingController();
    final experienceController = TextEditingController();
    final certificatesController = TextEditingController();
    final workplaceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("إضافة أخصائي جديد")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildField("اسم الأخصائي", nameController),
            const SizedBox(height: 15),
            _buildField("العمر", ageController, keyboard: TextInputType.number),
            const SizedBox(height: 15),
            _buildField("رقم الموبايل", phoneController,
                keyboard: TextInputType.phone),
            const SizedBox(height: 15),
            _buildField("كلمة المرور", passwordController, obscure: true),
            const SizedBox(height: 15),
            _buildField("التخصص الدقيق", specialtyController),
            const SizedBox(height: 15),
            _buildField("سنوات الخبرة", experienceController,
                keyboard: TextInputType.number),
            const SizedBox(height: 15),
            _buildField("الشهادات", certificatesController, maxLines: 2),
            const SizedBox(height: 15),
            _buildField("مكان العمل", workplaceController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تمت إضافة الأخصائي")),
                );
                Navigator.pop(context);
              },
              child: const Text("إضافة"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller,
      {bool obscure = false,
      TextInputType keyboard = TextInputType.text,
      int maxLines = 1}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboard,
      maxLines: maxLines,
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
