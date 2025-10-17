import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

const lightBlue = Color(0xFFD9EFFA);
const blueAccent = Color(0xFF4C9CF0);
const highlightBlue = Color(0xFF2F7BE6);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Components Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: blueAccent,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      initialRoute: '/intro',
      routes: {
        '/intro': (_) => const IntroScreen(),
        '/': (_) => const ComponentsListScreen(),
        '/text': (_) => const TextDetailScreen(),
        '/images': (_) => const ImagesScreen(),
        '/textfield': (_) => const TextFieldScreen(),
        '/rowlayout': (_) => const RowLayoutScreen(),
      },
    );
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/02.png', height: 160),
              const SizedBox(height: 130),
              const Text(
                'Jetpack Compose',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              const SizedBox(height: 132),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ComponentsListScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 120,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "I'm ready",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComponentsListScreen extends StatelessWidget {
  const ComponentsListScreen({super.key});

  Widget sectionTitle(String t) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(t, style: const TextStyle(fontWeight: FontWeight.bold)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UI Components List',
          style: TextStyle(
            color: Color.fromARGB(255, 26, 125, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const SizedBox.shrink(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ListView(
            children: const [
              _Section(
                title: 'Display',
                items: [
                  _ComponentItem(
                    title: 'Text',
                    subtitle: 'Displays text',
                    route: '/text',
                  ),
                  _ComponentItem(
                    title: 'Image',
                    subtitle: 'Displays an image',
                    route: '/images',
                  ),
                ],
              ),
              _Section(
                title: 'Input',
                items: [
                  _ComponentItem(
                    title: 'TextField',
                    subtitle: 'Input field for text',
                    route: '/textfield',
                  ),
                  _ComponentItem(
                    title: 'PasswordField',
                    subtitle: 'Input field for passwords',
                    route: '/textfield',
                  ),
                ],
              ),
              _Section(
                title: 'Layout',
                items: [
                  _ComponentItem(
                    title: 'Column',
                    subtitle: 'Arranges elements vertically',
                    route: '/rowlayout',
                  ),
                  _ComponentItem(
                    title: 'Row',
                    subtitle: 'Arranges elements horizontally',
                    route: '/rowlayout',
                  ),
                ],
              ),
              _SelfStudyBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<_ComponentItem> items;
  const _Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        ...items,
      ],
    );
  }
}

class _ComponentItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String route;
  const _ComponentItem({
    required this.title,
    required this.subtitle,
    required this.route,
  });

  @override
  State<_ComponentItem> createState() => _ComponentItemState();
}

class _ComponentItemState extends State<_ComponentItem> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, widget.route),
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            color: _hover ? Colors.red[100] : lightBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                widget.subtitle,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelfStudyBox extends StatefulWidget {
  const _SelfStudyBox();

  @override
  State<_SelfStudyBox> createState() => _SelfStudyBoxState();
}

class _SelfStudyBoxState extends State<_SelfStudyBox> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(top: 14),
        decoration: BoxDecoration(
          color: _hover ? Colors.red[100] : Colors.red[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Tự tìm hiểu\nTìm ra tất cả các thành phần UI cơ bản',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}

class TextDetailScreen extends StatelessWidget {
  const TextDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Text Detail',
          style: TextStyle(
            color: Color.fromARGB(255, 26, 125, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black87,
                  height: 1.4,
                ),
                children: [
                  const TextSpan(text: 'The '),
                  const TextSpan(
                    text: ' quick ',
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                  TextSpan(
                    text: ' Brown',
                    style: TextStyle(
                      color: Colors.orange[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                  const TextSpan(text: '\n\nfox '),
                  const TextSpan(
                    text: 'j u m p s ',
                    style: TextStyle(letterSpacing: 6.0),
                  ),
                  const TextSpan(
                    text: 'over\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: 'the ',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                    text: ' lazy ',
                    style: GoogleFonts.dancingScript(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const TextSpan(text: ' dog. '),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Images',
          style: TextStyle(
            color: Color.fromARGB(255, 26, 125, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://s.cmx-cdn.com/giaothongvantaitphcm.edu.vn/wp-content/uploads/2024/06/ky-niem-36-nam-thanh-lap-truong-dai-hoc-giao-thong-van-tai-tphcm-560px.jpg',
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) => Container(
                  height: 200,
                  color: Colors.grey[200],
                  alignment: Alignment.center,
                  child: const Text('Network image not available'),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'https://giaothongvantaitphcm.edu.vn/templates/themes/images/logo.png?v=13.1.5',
              style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/01.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text('In app', style: TextStyle(color: Colors.black54)),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  final TextEditingController _ctrl = TextEditingController();
  String message = '';

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(() {
      setState(() {
        message = _ctrl.text.isEmpty
            ? 'Tự động cập nhật dữ liệu theo textfield'
            : 'Bạn đang nhập: ${_ctrl.text}';
      });
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TextField',
          style: TextStyle(
            color: Color.fromARGB(255, 26, 125, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _ctrl,
                decoration: InputDecoration(
                  hintText: 'Thông tin nhập',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.center,
                child: Text(
                  message,
                  style: TextStyle(
                    color: _ctrl.text.isEmpty
                        ? Colors.red[400]
                        : Colors.green[700],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowLayoutScreen extends StatelessWidget {
  const RowLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Row Layout',
          style: TextStyle(
            color: Color.fromARGB(255, 26, 125, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double tileWidth = (constraints.maxWidth - 32) / 3;
              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(12, (index) {
                  return SizedBox(
                    width: tileWidth,
                    height: 80,
                    child: _HoverTile(index: index),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HoverTile extends StatefulWidget {
  final int index;
  const _HoverTile({required this.index});

  @override
  State<_HoverTile> createState() => _HoverTileState();
}

class _HoverTileState extends State<_HoverTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final bool highlighted = (widget.index % 3) == 1;
    final baseColor = highlighted ? highlightBlue : lightBlue;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: _hover ? Colors.red[100] : baseColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
