
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Processing with AI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FileProcessingScreen(),
    );
  }
}

class FileProcessingScreen extends StatefulWidget {
  const FileProcessingScreen({super.key});

  @override
  State<FileProcessingScreen> createState() => _FileProcessingScreenState();
}

class _FileProcessingScreenState extends State<FileProcessingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF5b7cb9), Color(0xFF454f61)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Navbar
              // Form Area
              // File Trees
            ],
          ),
        ),
      ),
    );
  }
}
