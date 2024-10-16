import 'package:flutter/material.dart';
import 'package:face_count/configs/theme.dart'; 
import 'edit_acara.dart';

class GradientHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBack;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const GradientHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onBack,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16.0, right: 3.0, top: 70.0, bottom: 70.0), 
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [purple950, purpleBase], 
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/acara_card_flower.png'),
              alignment: Alignment.topRight,
              scale: 1.3, 
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const ImageIcon(AssetImage('assets/icons/arrow_back.png'), color: Colors.white),
                    onPressed: onBack,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: regularTS.copyWith(fontSize: 24, color: Colors.white),
                      ),
                      Text(
                        subtitle,
                        style: regularTS.copyWith(fontSize: 16, color: const Color.fromARGB(119, 255, 255, 255)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const ImageIcon(AssetImage('assets/icons/edit.png'), color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditAcara()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const ImageIcon(AssetImage('assets/icons/delete.png'), color: Colors.white),
                        onPressed: onDelete,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
