class MixShared {
  /// ``` dart
  /// print(MixShared.bulan); // [Januari, ...]
  /// print(MixShared.bulan.map((e) => e.substring(0, 3)).toList()); // [Jan, Feb, ...]
  /// ```
  static const List<String> bulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  static const List<String> hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
}
