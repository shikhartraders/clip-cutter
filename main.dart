import 'package:flutter/material.dart';

void main() {
  runApp(const ClipSnapApp());
}

class ClipSnapApp extends StatelessWidget {
  const ClipSnapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClipSnap AI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B0B12),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF4DA3FF),
          secondary: Color(0xFF7C5CFF),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

/* ---------------- SPLASH SCREEN ---------------- */

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ClipSnap AI',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Turn any video into viral clips',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
              child: const Text('Get Started'),
            )
          ],
        ),
      ),
    );
  }
}

/* ---------------- HOME SCREEN ---------------- */

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClipSnap AI')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const UploadScreen()),
            );
          },
          child: Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Color(0xFF4DA3FF), Color(0xFF7C5CFF)],
              ),
            ),
            child: const Center(
              child: Text(
                '+ Upload Video',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* ---------------- UPLOAD SCREEN ---------------- */

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Video')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: const Center(
                child: Text('Tap to upload video'),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StyleScreen()),
                );
              },
              child: const Text('Continue'),
            )
          ],
        ),
      ),
    );
  }
}

/* ---------------- STYLE SCREEN ---------------- */

class StyleScreen extends StatelessWidget {
  const StyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = [
      '🔥 Viral',
      '🎙 Podcast',
      '🎮 Gaming',
      '🎓 Education',
      '😂 Meme'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Select Style')),
      body: ListView.builder(
        itemCount: styles.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(styles[i]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProcessingScreen()),
            );
          },
        ),
      ),
    );
  }
}

/* ---------------- PROCESSING SCREEN ---------------- */

class ProcessingScreen extends StatelessWidget {
  const ProcessingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ResultScreen()),
      );
    });

    return const Scaffold(
      body: Center(
        child: Text(
          'AI is finding viral moments...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/* ---------------- RESULT SCREEN ---------------- */

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Viral Clips')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, i) => Card(
          child: ListTile(
            title: Text('Clip ${i + 1}'),
            subtitle: const Text('Duration: 25s • Viral Score: High'),
            trailing: const Icon(Icons.download),
          ),
        ),
      ),
    );
  }
}
