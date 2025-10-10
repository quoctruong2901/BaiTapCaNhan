// Thực hành 02
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
      home: NumberInputScreen(),
    );
  }
}

class NumberInputScreen extends StatefulWidget {
  const NumberInputScreen({super.key});

  @override
  State<NumberInputScreen> createState() => _NumberInputScreenState();
}

class _NumberInputScreenState extends State<NumberInputScreen> {
  final TextEditingController _controller = TextEditingController();
  List<int> numbers = [];
  String? errorMessage;

  void _generateList() {
    setState(() {
      errorMessage = null;
      numbers.clear();

      final input = _controller.text.trim();

      // Check xem có đúng số không
      final parsed = int.tryParse(input);

      if (parsed == null || parsed > 4) {
        errorMessage = "Dữ liệu bạn nhập không hợp lệ";
      } else {
        numbers = List.generate(parsed, (index) => index + 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Thực hành 02'), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // 👈 Chỉ chiếm chiều cao cần thiết
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  // Ô nhập liệu và nút tạo
                  child: const Text(
                    'Thực hành 02',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Nhập vào số lượng',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _generateList,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                      child: const Text(
                        "Tạo",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Hiển thị thông báo lỗi
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                const SizedBox(height: 10),

                // Hiển thị danh sách
                Flexible(
                  // 👈 Dùng Flexible thay vì Expanded
                  fit: FlexFit.loose,
                  child: ListView.builder(
                    shrinkWrap: true, // 👈 ListView chỉ cao vừa đủ
                    itemCount: numbers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ListTile(
                          title: Center(
                            child: Text(
                              numbers[index].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
