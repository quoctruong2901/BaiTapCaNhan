import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThreeTextFieldScreen(),
    );
  }
}

class ThreeTextFieldScreen extends StatefulWidget {
  const ThreeTextFieldScreen({super.key});

  @override
  State<ThreeTextFieldScreen> createState() => _ThreeTextFieldScreenState();
}

class _ThreeTextFieldScreenState extends State<ThreeTextFieldScreen> {
  final TextEditingController field1Controller = TextEditingController();
  final TextEditingController field2Controller = TextEditingController();
  final TextEditingController field3Controller = TextEditingController();

  void handleSubmit() {
    final value1 = field1Controller.text;
    final value2 = field2Controller.text;
    final value3 = field3Controller.text;

    // Hiển thị thông báo
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Giá trị: $value1, $value2, $value3')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: TextEditingController(text: "My First App"),
                style: const TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: TextEditingController(text: "Hello"),
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Gửi dữ liệu",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
