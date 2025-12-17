import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hifzan/firebase_options.dart';
import 'package:hifzan/kegiatan.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Kegiatan> daftarkegiatan = [];
  // Future<void> meemuatData() async {
  //     final url = '../assets/Kegiatan.json';
  //     final loadjson = await rootBundle.loadString(url);
  //     final datajson = jsonDecode(loadjson);
  //     for (var data in datajson) {
  //       daftarkegiatan.add(Kegiatan.fromMap(data));
  //     }

  var ctrl = TextEditingController();
  Future<void> memuatData() async {
    final result = await FirebaseFirestore.instance.collection('daftar-kegiatan').get();
    for (var data in result.docs) {
      daftarkegiatan.add(Kegiatan.fromMap(data.data()));
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
          future: memuatData(),
          builder: (context, snapshot) {
            return Center(
              child: Column(
                children: [
                  TextField(controller: ctrl, decoration: InputDecoration(border: OutlineInputBorder())),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance.collection('daftar-kegiatan').add({
                        'nama': ctrl.text,
                        'deskripsi': 'bola',
                      });
                    },
                    child: Text('tambah'),
                  ),
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
