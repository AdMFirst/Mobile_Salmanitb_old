import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Add your back button functionality here
              },
            ),
            SizedBox(height: 40),
            Text(
              'Selamat datang kembali',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8D9F91),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Login ke akun anda',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: Color(0xFF8D9F91),
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Anda',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon:
                    Icon(Icons.email_outlined, color: Color(0xFFEBC5B7)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password Anda',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: Icon(Icons.lock_outline, color: Color(0xFFEBC5B7)),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                    Text(
                      'Ingat saya',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Color(0xFF8D9F91),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Add your forgot password functionality here
                  },
                  child: Text(
                    'Lupa password?',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: Color(0xFF8D9F91),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your login functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA1B19A),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Masuk',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Baru di sini?',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: Color(0xFF8D9F91),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your sign-up functionality here
                    },
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Color(0xFF8D9F91),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
