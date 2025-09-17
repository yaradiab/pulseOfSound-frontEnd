import 'package:flutter/material.dart';
import '../Colors/colors.dart';


class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  final List<_AdminCardItem> _items = const [
    _AdminCardItem(title: "لوحة التحكم", icon: Icons.dashboard, color: AppColors.lightBlue),
    _AdminCardItem(title: "الأطباء", icon: Icons.medical_services, color: AppColors.peach),
    _AdminCardItem(title: "الأخصائيين", icon: Icons.psychology, color: AppColors.lilac),
    _AdminCardItem(title: "الأطفال", icon: Icons.child_care, color: AppColors.pinky),
    _AdminCardItem(title: "المدراء", icon: Icons.admin_panel_settings, color: AppColors.softBeige),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // خلفية بتدرج
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.lavender, AppColors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return _buildCard(context, item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, _AdminCardItem item) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("فتحت صفحة ${item.title}")),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: item.color.withOpacity(0.2),
              radius: 32,
              child: Icon(item.icon, size: 40, color: item.color),
            ),
            const SizedBox(height: 12),
            Text(
              item.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.textLight,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminCardItem {
  final String title;
  final IconData icon;
  final Color color;

  const _AdminCardItem({required this.title, required this.icon, required this.color});
}
