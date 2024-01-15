import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/models/calendar_model.dart';

bool aramaYapiliyorMu = false;

Future<void> ara(String aramaKelimesi) async {
  print("Ara : $aramaKelimesi");
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late List<CalendarModel> events;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    events = educationList;
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
              onPressed: () {}, icon: const Icon(Icons.filter_list_rounded))
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
