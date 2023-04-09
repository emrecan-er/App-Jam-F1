import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/local_storage.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/modals/task_model.dart';
import 'package:intl/intl.dart';

class TaskItem extends StatefulWidget {
  Task task;
  TaskItem({super.key, required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final TextEditingController _taskNameController = TextEditingController();
  late LocalStorage _localStorage;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _localStorage = locator<LocalStorage>();
    _taskNameController.text = widget.task.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 10
          ),
        ]
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: (){
            widget.task.isCompleted =!widget.task.isCompleted;
            _localStorage.updateTask(task: widget.task);
            setState(() {
              
            });
          },
          child: Container(
            child: const Icon(Icons.check, color: Colors.white,),
            decoration: BoxDecoration(
              color: widget.task.isCompleted ? Colors.green : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 0.8)
            ),
          ),
        ),
        title: widget.task.isCompleted ? Text(widget.task.name, style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),) : 
        TextField(
          autofocus: true,
          controller: _taskNameController,
          textInputAction: TextInputAction.done,
          minLines: 1,
          maxLines: null,
          decoration: InputDecoration(border: InputBorder.none),
          onSubmitted: (yeniDeger){
              widget.task.name = yeniDeger;
              _localStorage.updateTask(task: widget.task);
          },
        ),
        trailing: Text(
          DateFormat('hh:mm a').format(widget.task.createdAt), style: TextStyle(
            fontSize: 14, color: Colors.grey
          ),
        ),
      ),
    );
  }
}