import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomeScreen.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  int _seconds = 30;
  Timer? _timer;
  bool canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _seconds = 30;
      canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        setState(() {
          canResend = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _verifyOtp() async {
    String code = _controllers.map((c) => c.text).join();

    if (code == "1234") {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("hasSession", true);
      await prefs.setString("phone", widget.phone);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("الكود غير صحيح"),
          backgroundColor: Color(0xFFE57373),
        ),
      );
    }
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 55,
      child: TextField(
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A237E), 
        ),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white.withOpacity(0.9),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFFFD600), width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < _controllers.length - 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "أدخل رمز التحقق: ",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A237E),
                    ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) => _buildOtpBox(index)),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _verifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD600),
                    foregroundColor: const Color(0xFF1A237E),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "تأكيد الكود",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                canResend
                    ? TextButton(
                        onPressed: () {
                          //   طلب جديد للباك لإرسال الكود
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("تم إرسال رمز جديد")),
                          );
                          _startTimer();
                        },
                        child: const Text(
                          "إعادة إرسال الرمز",
                          style: TextStyle(
                            color: Color(0xFF1A237E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Text(
                        "يمكنك إعادة الإرسال خلال $_seconds ثانية",
                        style: const TextStyle( color: Color(0xFF1A237E)),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}