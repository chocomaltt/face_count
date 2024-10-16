import 'package:face_count/configs/theme.dart';
import 'package:flutter/material.dart';
import 'widgets/gradient_header.dart';

class DetailAcaraPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String time;
  final String place;
  final String attendees;

  const DetailAcaraPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.time,
    required this.place,
    required this.attendees,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientHeader(
            title: title,
            subtitle: subtitle,
            onBack: () => Navigator.pop(context),
            onEdit: () {
            },
            onDelete: () {
            },
          ),
          Positioned(
            top: 200, 
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.60, 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Acara',
                      style: regularTS.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(252, 238, 238, 238),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ImageIcon(AssetImage('assets/icons/calendar_picker.png'), color: Colors.black54),
                            SizedBox(width: 8),
                            Text(
                              date,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(height: 40, color:Colors.black54),
                        Row(
                          children: [
                            ImageIcon(AssetImage('assets/icons/time.png'), color: Colors.black54),
                            SizedBox(width: 8),
                            Text(
                              time,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(height: 40, color: Colors.black54),
                        Row(
                          children: [
                            ImageIcon(AssetImage('assets/icons/place.png'), color: Colors.black54),
                            SizedBox(width: 8),
                            Text(
                              place,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(height: 40, color: Colors.black54),
                        Row(
                          children: [
                            ImageIcon(AssetImage('assets/icons/group.png'), color: Colors.black54),
                            SizedBox(width: 8),
                            Text(
                              attendees,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ),
                    Spacer(), 
                    ElevatedButton.icon(
                      onPressed: () {
                      },
                      icon: ImageIcon(AssetImage('assets/icons/scan.png'), color: Colors.white),
                      label: Text('Scan Pengunjung', style: regularTS.copyWith(fontSize: 14, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), 
                        ),
                        backgroundColor: const Color.fromARGB(255, 72, 33, 243), 
                        elevation: 0, 
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
