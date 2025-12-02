import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> daftarkegiatan = [];
  @override
  void initState() {
    super.initState();
    daftarkegiatan = [
      {"nama": "belajar", "deskripsi": "belajar pr ipa"},
      {"nama": "belajar", "deskripsi": "belajar pr ips"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Center(
          child: Column(
            children: [
              ...List.generate(daftarkegiatan.length, (index) {
                var kegiatan = daftarkegiatan[index];
                return Card(
                  child: ListTile(
                    title: Text(kegiatan["nama"].toString()),
                    subtitle: Text(kegiatan["deskripsi"].toString()),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
