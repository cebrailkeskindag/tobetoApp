import 'package:flutter/material.dart';
import 'package:tobetoapp/models/exam.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({Key? key, required this.exam}) : super(key: key);
  final Exam exam;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
 
    double screenWidth = mediaQuery.size.width;
 
    return Padding(
      padding: EdgeInsets.all(screenWidth / 30),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Sınavlarım",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 200,
                child: AspectRatio(
                  aspectRatio: 8 / 9,
                  child: Card(
                    elevation: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                  softWrap: true,
                                  exam.examTitle,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900)),
                            ),
                            const Icon(
                              Icons.check_box,
                              color: Colors.purple,
                            )
                          ],
                        ),
                        Text(
                          exam.examClass,
                          style: const TextStyle(fontSize: 11),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.timer_outlined,
                                color: Colors.purple,
                              ),
                              Text(
                                exam.examTime,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
