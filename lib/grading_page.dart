import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imsystem/utils/grading_data.dart';
import 'exam_page.dart';
import 'models/grade.dart';

class GradingCard extends StatelessWidget {
  final Exam exam;

  GradingCard(name, description, grade, course, {Key? key})
      : exam = Exam(name, description, grade, course),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.assignment),
          title: Text(exam.getName()),
          subtitle:
              Text(exam.getDescription(), overflow: TextOverflow.ellipsis),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExamPage(exam),
          ),
        );
      },
    );
  }
}

class GradingPage extends StatelessWidget {
  const GradingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Grades"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        shrinkWrap: true,
        children: myExams
            .map((exam) => GradingCard(
                  exam.getName(),
                  exam.getDescription(),
                  exam.getGrade(),
                  exam.getCourse(),
                ))
            .toList(),
      ),
    );
  }
}
