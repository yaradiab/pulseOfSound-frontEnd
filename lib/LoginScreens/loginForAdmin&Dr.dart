import 'package:flutter/material.dart';
import '../HomeScreens/AdminHomeScreen.dart';
import '../HomeScreens/DoctorHomeScreen.dart';
import 'loginscreen.dart';

class LoginForAdminAndDr extends StatefulWidget {
  const LoginForAdminAndDr({super.key});

  @override
  State<LoginForAdminAndDr> createState() => _LoginForAdminAndDrState();
}

class _LoginForAdminAndDrState extends State<LoginForAdminAndDr> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username == "admin" && password == "1234") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(" مرحباً Admin"), backgroundColor: Colors.green),
      );
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const AdminHomeScreen()));
    }

    if (username == "doctor" && password == "4321") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(" مرحباً دكتور"), backgroundColor: Colors.green),
      );
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const Doctorhomescreen()));
    }

    if (!(username == "admin" && password == "1234") &&
        !(username == "doctor" && password == "4321")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(" اسم المستخدم أو كلمة المرور غير صحيحة"), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
  
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("images/background.jpg", fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          
          Positioned(
            top: 30,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF1A237E), size: 30),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "تسجيل الدخول للأدمن / الدكتور",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _usernameController,
                  style: const TextStyle(color: Color(0xFF1A237E)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person, color: Color(0xFF1A237E)),
                    labelText: "اسم المستخدم",
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Color(0xFF1A237E)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Color(0xFF1A237E)),
                    labelText: "كلمة المرور",
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD600),
                    foregroundColor: const Color(0xFF1A237E),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("تسجيل الدخول",style: TextStyle(fontWeight: FontWeight.bold,color:Color(0xFF1A237E) ),)
                  ,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
