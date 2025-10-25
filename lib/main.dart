import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        // Warna utama aplikasi
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',

        // Warna dasar untuk komponen Material
        colorScheme: const ColorScheme.light(
          primary: Colors.green,
          secondary: Colors.lightGreen,
          onPrimary: Colors.white, // teks/icon di atas warna primary → putih
          onSecondary: Colors.white,
          onSurface: Colors.black, // teks biasa di atas permukaan terang
        ),

        // Tema untuk tombol
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white, // teks tombol putih
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),

        // Warna teks default
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),

        // Warna icon
        iconTheme: const IconThemeData(color: Colors.white),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}
