import 'package:flutter/material.dart';
import 'package:face_count/features/acara/tambah_acara.dart';

class EditAcara extends StatelessWidget {
  const EditAcara({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const TambahAcara(isEditMode: true),
    );
  }
}
