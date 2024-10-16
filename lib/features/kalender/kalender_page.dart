import 'package:face_count/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

import '../beranda/widgets/acara_beranda_card.dart';
import 'detail_acara_page.dart';

class KalenderPage extends StatefulWidget {
  const KalenderPage({super.key});

  @override
  State<KalenderPage> createState() => _KalenderPageState();
}

class _KalenderPageState extends State<KalenderPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final isEventEmpty = false;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${DateFormat('MMMM').format(_selectedDate)} ${_selectedDate.year}', // Display month name
              style: mediumTS.copyWith(fontSize: 20),
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Image.asset(
                'assets/icons/calendar_picker.png',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (index) {
                final date = _selectedDate.add(Duration(days: index - _selectedDate.weekday));
                return GestureDetector(
                  onTap: () => setState(() => _selectedDate = date),
                  child: Column(
                    children: [
                      Text(
                        ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'][date.weekday % 7],
                        style: regularTS.copyWith(fontSize: 12),
                      ),
                      Text(
                        '${date.day}',
                        style: mediumTS.copyWith(fontSize: 16),
                      ),
                      if (_selectedDate.day == date.day && _selectedDate.month == date.month && _selectedDate.year == date.year) 
                        Container(
                          height: 2,
                          width: 20,
                          color: Colors.black,
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: isEventEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/no_event.png'),
                        Text(
                          'Belum ada event yang tercatat.',
                          style: mediumTS.copyWith(fontSize: 20),
                        ),
                        const Text(
                          'Tambahkan event pertama kamu sekarang!',
                          style: regularTS,
                        )
                      ],
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailAcaraPage(
                                title: 'Seminar Nasional',
                                subtitle: 'Tips Belajar Machine Learning',
                                date: 'Selasa, 16 Sep 2024',
                                time: '08:00 - 12:00',
                                place: 'Auditorium Lt.8',
                                attendees: '500 orang',
                              ),
                            ),
                          );
                        },
                        child: AcaraBerandaCard(
                          leftColor: purple950,
                          rightColor: purpleBase,
                          title: 'Seminar Nasional',
                          status: 'Akan Datang',
                          time: '08.00 - 12.00',
                          place: 'Auditorium Lt. 8',
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailAcaraPage(
                                title: 'Kuliah Tamu',
                                subtitle: 'Pembicara Tamu dari Industri',
                                date: 'Rabu, 17 Sep 2024',
                                time: '10:00 - 14:00',
                                place: 'Auditorium Lt.8',
                                attendees: '300 orang',
                              ),
                            ),
                          );
                        },
                        child: AcaraBerandaCard(
                          leftColor: red950,
                          rightColor: redBase,
                          title: 'Kuliah Tamu',
                          status: 'Akan Datang',
                          time: '10.00 - 14.00',
                          place: 'Auditorium Lt. 8',
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailAcaraPage(
                                title: 'Workshop',
                                subtitle: 'Pelatihan Keterampilan Teknis',
                                date: 'Kamis, 18 Sep 2024',
                                time: '09:00 - 15:00',
                                place: 'Ruang Lab 1',
                                attendees: '100 orang',
                              ),
                            ),
                          );
                        },
                        child: AcaraBerandaCard(
                          leftColor: primary950,
                          rightColor: primaryBase,
                          title: 'Workshop',
                          status: 'Berlangsung',
                          time: '09.00 - 15.00',
                          place: 'Ruang Lab 1',
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }
}
