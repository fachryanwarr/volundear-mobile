import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:volundear/drawer.dart';
import 'package:volundear/pages/artikel_page.dart';

class ArtikelForm extends StatefulWidget {
  const ArtikelForm({super.key});
  @override
  State<ArtikelForm> createState() => _ArtikelFormState();
}

class _ArtikelFormState extends State<ArtikelForm> {
  final _formKey = GlobalKey<FormState>();

  final String _model = "artikel.artikel";
  final int _pk = 0;
  int _penulis = 0;
  String _judul = "";
  final String _rilis = (DateTime.now()).toString();
  String _pembuka = "";
  String _isi = "";

  Future<void> submit(
    BuildContext context, String model, int pk, int penulis, String judul, String rilis, String pembuka, String isi) async {
    String modelController = model;
    int pkController = pk;
    int penulisController = penulis;
    String judulController = judul;
    String rilisController = rilis;
    String pembukaController = pembuka;
    String isiController = isi;
    final response = await http.post(
        Uri.parse(
            "https://volundear.up.railway.app/artikel/json/"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'model' : modelController,
          'pk': pkController + 1,
          'penulis': penulisController,
          'judul': judulController,
          'rilis': rilisController,
          'pembuka': pembukaController,
          'isi': isiController,
        }));
    // ignore: avoid_print
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Tambahkan Artikel"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Form Penulis
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Isi dengan nama sesuai identitas",
                      labelText: "Nama Penulis",
                      icon: const Icon(Icons.person, 
                      color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            _penulis = int.parse(value!);
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            _penulis = int.parse(value!);
                        });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Nama penulis tidak boleh kosong!';
                        }
                        return null;
                    },
                  ),
                ),
                // Form Judul
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Isi dengan judul artikel",
                      labelText: "Judul Artikel",
                      icon: const Icon(Icons.title, 
                            color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            _judul = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            _judul = value!;
                        });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Judul artikel tidak boleh kosong!';
                        }
                        return null;
                    },
                  ),
                ),
                // Form Pembuka
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Isi dengan kalimat pembuka artikel",
                      labelText: "Pembuka Artikel",
                      icon: const Icon(Icons.text_fields, 
                            color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            _pembuka = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            _pembuka = value!;
                        });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Pembuka artikel tidak boleh kosong!';
                        }
                        return null;
                    },
                  ),
                ),
                // Form Isi
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Isi dengan isi artikel",
                      labelText: "Isi Artikel",
                      icon: const Icon(Icons.text_fields, 
                            color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            _isi = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            _isi = value!;
                        });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Isi artikel tidak boleh kosong!';
                        }
                        return null;
                    },
                  ),
                ),
                // Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Save button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: 
                        TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xFFe971d7)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            submit(context, _model, _pk, _penulis, _judul, _rilis, _pembuka, _isi);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const ArtikelPage()),
                            );
                          }
                        },
                        child: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    // Back button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xFFe971d7)),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
