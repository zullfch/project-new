import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hifzan/kegiatan.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Kegiatan> daftarkegiatan = [];
  Future<void> meemuatData() async {
    final url = '../assets/Kegiatan.json';
    final loadjson = await rootBundle.loadString(url);
    final datajson = jsonDecode(loadjson);
    for (var data in datajson) {
      daftarkegiatan.add(Kegiatan.fromMap(data));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: FutureBuilder(
          future: meemuatData(),
          builder: (context, snapshot) {
            return Center(
              child: Column(
                children: [
                  ...List.generate(daftarkegiatan.length, (index) {
                    var kegiatan = daftarkegiatan[index];
                    return Card(
                      child: ListTile(
                        title: Text(kegiatan.nama.toString()),
                        subtitle: Text(kegiatan.deskripsi.toString()),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
