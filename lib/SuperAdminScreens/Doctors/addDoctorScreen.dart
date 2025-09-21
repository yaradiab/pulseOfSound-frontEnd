import 'package:flutter/material.dart';

class AddDoctorPage extends StatelessWidget {
  const AddDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final certificatesController = TextEditingController();
    final experienceController = TextEditingController();
    final workplaceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة طبيب جديد"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildField("الاسم الكامل", nameController),
            const SizedBox(height: 15),
            _buildField("العمر", ageController, keyboard: TextInputType.number),
            const SizedBox(height: 15),
            _buildField("رقم الموبايل", phoneController,
                keyboard: TextInputType.phone),
            const SizedBox(height: 15),
            _buildField("البريد الإلكتروني", emailController,
                keyboard: TextInputType.emailAddress),
            const SizedBox(height: 15),
            _buildField("كلمة المرور", passwordController, obscure: true),
            const SizedBox(height: 15),
            _buildField("الشهادات", certificatesController, maxLines: 2),
            const SizedBox(height: 15),
            _buildField("سنوات الخبرة", experienceController,
                keyboard: TextInputType.number),
            const SizedBox(height: 15),
            _buildField("مكان العمل", workplaceController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //    مع الباك
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تمت إضافة الطبيب بنجاح")),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
