import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  final Map<String, dynamic> task;
  final int index;

  const EditTaskScreen({super.key, required this.task, required this.index});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController nameController;
  late TextEditingController stepController;
  late TextEditingController instructionsController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.task["taskname"]);
    stepController = TextEditingController(text: widget.task["snumber"]);
    instructionsController =
        TextEditingController(text: widget.task["insturctions"]);
  }

  @override
  void dispose() {
    nameController.dispose();
    stepController.dispose();
    instructionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Task Name")),
            TextField(controller: stepController, decoration: InputDecoration(labelText: "Step Number")),
            TextField(controller: instructionsController, decoration: InputDecoration(labelText: "Instructions")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedTask = {
                  "taskname": nameController.text,
                  "snumber": stepController.text,
                  "insturctions": instructionsController.text,
                };
                Navigator.pop(context, updatedTask); // Send back updated task
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
