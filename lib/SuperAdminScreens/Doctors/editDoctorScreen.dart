import 'package:flutter/material.dart';

class EditDoctorPage extends StatelessWidget {
  final Map<String, String> doctor;

  const EditDoctorPage({super.key, required this.doctor, required String name});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: doctor["name"]);
    final ageController = TextEditingController(text: doctor["age"] ?? "");
    final phoneController = TextEditingController(text: doctor["phone"] ?? "");
    final emailController = TextEditingController(text: doctor["email"] ?? "");
    final passwordController =
        TextEditingController(text: doctor["password"] ?? "");
    final certificatesController =
        TextEditingController(text: doctor["certificates"] ?? "");
    final experienceController =
        TextEditingController(text: doctor["experience"] ?? "");
    final workplaceController =
        TextEditingController(text: doctor["workplace"] ?? "");

    return Scaffold(
      appBar: AppBar(
        title: const Text("تعديل بيانات الطبيب"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildField(
              "الاسم الكامل",
              nameController,
            ),
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
                //     الباك
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تم تعديل بيانات الطبيب")),
                );
                Navigator.pop(context);
              },
              child: const Text("حفظ التعديلات"),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                //  حذف الطبيب
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تم حذف الطبيب")),
                );
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text("حذف الطبيب"),
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
