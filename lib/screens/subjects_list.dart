import 'package:flutter/material.dart';

class SubjectsList extends StatefulWidget {
  @override
  State createState() => _SubjectsListState();
}

class _SubjectsListState extends State<SubjectsList> {
  List<String> subjects = [
    "Information Systems Analysis and Design",
    "Management Information Systems",
    "Mobile Information Systems",
    "Team project"
  ];

  final TextEditingController _subjectController = TextEditingController();

  void addSubject() {
    String newSubject = _subjectController.text;
    if (newSubject.isNotEmpty) {
      setState(() {
        subjects.add(newSubject);
        _subjectController.clear();
      });
    }
  }

  void deleteSubject(int index) {
    setState(() {
      subjects.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(132, 169, 140, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ListTile(
                      title: Text(subjects[index],
                          style: const TextStyle(
                              color: Color.fromRGBO(47, 62, 70, 1))),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteSubject(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _subjectController,
                      decoration: const InputDecoration(
                          labelText: 'Enter text',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(202, 210, 197, 1),
                          )),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: addSubject,
                    color: const Color.fromRGBO(202,210,197,1),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(82, 121, 111, 1));
  }
}
