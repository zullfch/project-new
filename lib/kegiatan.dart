import 'dart:convert';

class Kegiatan {
  final String nama;
  final String deskripsi;
  Kegiatan({this.nama = '', this.deskripsi = ''});

  Kegiatan copyWith({String? nama, String? deskripsi}) {
    return Kegiatan(nama: nama ?? this.nama, deskripsi: deskripsi ?? this.deskripsi);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nama': nama});
    result.addAll({'deskripsi': deskripsi});

    return result;
  }

  factory Kegiatan.fromMap(Map<String, dynamic> map) {
    return Kegiatan(nama: map['nama'] ?? '', deskripsi: map['deskripsi'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Kegiatan.fromJson(String source) => Kegiatan.fromMap(json.decode(source));

  @override
  String toString() => 'Kegiatan(nama: $nama, deskripsi: $deskripsi)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Kegiatan && other.nama == nama && other.deskripsi == deskripsi;
  }

  @override
  int get hashCode => nama.hashCode ^ deskripsi.hashCode;
}
