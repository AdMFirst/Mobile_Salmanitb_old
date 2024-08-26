import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salmanitb/pages/maintenance_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/landing': (context) => const LandingPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isNormalOperation = true;

  @override
  void initState() {
    super.initState();
    _checkNetworkConnection();
  }

  Future<void> _checkNetworkConnection() async {
    const String baseUrl = String.fromEnvironment("BASE_URL", defaultValue: 'https://salimapi.admfirst.my.id');
    
    try {
      var response = await http.get(
        Uri.parse("$baseUrl/up"),
        headers: {
          'User-Agent': 'SalmanITB/1.0.0',
        },
      );
      Future.delayed(Duration(seconds: Random.secure().nextInt(5)));

      if (response.statusCode == 200){
        Navigator.of(context).pushNamed('/landing');
      } else {
        throw const SocketException('Something went wrong');
      }
    } on SocketException catch (_) {
      setState(() {
        _isNormalOperation = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isNormalOperation == false ) {
      return const NoInternetPage();
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF806943),
              Color(0xFF6A5430)
            ], // Warna gradasi dari gelap ke terang
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/salim1.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'SI Salman ITB',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: const Center(
        child: Text(
          'Selamat datang di halaman utama!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
