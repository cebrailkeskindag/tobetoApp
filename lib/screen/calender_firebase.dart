import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:tobetoapp/models/calendar_model.dart';
import 'package:tobetoapp/models/profile_edit.dart';
import 'package:tobetoapp/widgets/calendar/filtercheckbutton.dart';

bool aramaYapiliyorMu = false;
final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFirestore = FirebaseFirestore.instance;

Future<void> ara(String aramaKelimesi) async {
  print("Ara : $aramaKelimesi");
}

class CalendarFirebase extends StatefulWidget {
  const CalendarFirebase({super.key, required this.educators});
  final List<Educator> educators;

  @override
  _CalendarFirebaseState createState() => _CalendarFirebaseState();
}

class _CalendarFirebaseState extends State<CalendarFirebase> {
    List<CalendarModel> events = [];
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  Educator? _selectedEducator;

  final TextEditingController _eventController = TextEditingController();
  Future<List<CalendarModel>> fetchEventsFromFirestore() async {
  // late List<CalendarModel> events = [];
    final user = firebaseAuthInstance.currentUser;

    var querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('calenderList')
        .get();
    querySnapshot.docs.forEach((doc) {
      events.add(CalendarModel.fromJson(doc.data()));
    });
    return events;
  }

  @override
  void initState() {
    fetchEventsFromFirestore().then((events) {
      setState(() {
        this.events = events;
      });
    });
    super.initState();
  }

  List<CalendarModel> _getEventsfromDay(DateTime date) {
    return events.where((event) => isSameDay(event.date, date)).toList();
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                decoration: const InputDecoration(hintText: "Eğitim Arayın.."),
                onChanged: (aramaSonucu) {
                  ara(aramaSonucu);
                },
              )
            : const Text("Takvim"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      child: Container(
                        color: Theme.of(context).colorScheme.background,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Eğitmen'),
                              DropdownButton<Educator>(
                                value: _selectedEducator,
                                hint: Text('Eğitmen Seçin',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                    )),
                                onChanged: (Educator? educator) {
                                  setState(() {
                                    _selectedEducator = educator;
                                  });
                                },
                                items:
                                    widget.educators.map((Educator educator) {
                                  return DropdownMenuItem<Educator>(
                                      value: educator,
                                      child: Text(
                                        educator.eduName,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                      ));
                                }).toList(),
                              ),
                              const FilterCheckButton(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.filter_list_rounded))
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(2020),
            lastDay: DateTime(2025),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,
            daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                weekendStyle: TextStyle(fontWeight: FontWeight.bold)),
            daysOfWeekHeight: 25,
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            eventLoader: _getEventsfromDay,
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: const TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: _getEventsfromDay(selectedDay)
                    .map((CalendarModel event) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          event.title,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Eğitmen: ${event.author}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${event.date.day.toString().padLeft(2, "0")}.${event.date.month.toString().padLeft(2, "0")}.${event.date.year}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${event.hour.toString().padLeft(2, "0")}:${event.minute.toString().padLeft(2, "0")}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
