import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/local_storage.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/widgets/task_list_item.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../modals/task_model.dart';


class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  late List<Task> _allTask;
  late LocalStorage _localStorage;

  @override
  void initState() {
    super.initState();
    _localStorage=locator<LocalStorage>();
    _allTask = <Task>[];
    _getAllTaskFromDb();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      elevation: 0,
      title: GestureDetector(
        onTap: () {
          _showAddTaskBottomSheet(context);
        },
        child: Text(
          "Yapacaklarım",
          style: TextStyle(
            fontFamily: 'VarelaRound',
            )
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.search)
        ),
        IconButton(
          onPressed: (){
            _showAddTaskBottomSheet(context);
          }, 
          icon: Icon(Icons.add)
        )
      ],
     ),
     body: _allTask.isNotEmpty ? ListView.builder(
      itemBuilder: (context, index) {
        var _listElementNow = _allTask[index];
        return Dismissible(
          background: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete, color: Colors.grey),
              SizedBox(width: 8),
              TextManager(message: "Bu görev silindi")
            ],
          ),
          key: Key(_listElementNow.id),
          onDismissed: (direction){
            _allTask.removeAt(index);
            _localStorage.deleteTask(task: _listElementNow);
            setState(() {
              
            });
          },
          child: TaskItem(task: _listElementNow),
        );
      },
      itemCount: _allTask.length,
    ) : Center(child: TextManager(message: "Görev ekle!!!"),)
    );
  }

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          width: MediaQuery.of(context).size.width,
          child: ListTile(
            title: TextField(
              style: const TextStyle(fontSize: 20, fontFamily: 'VarelaRound'),
              decoration: InputDecoration(
                hintText: 'Ne Yapacağım?',
                border: InputBorder.none
              ),
              onSubmitted: (value){
                Navigator.of(context).pop();
                if(value.length>3){
                  DatePicker.showTimePicker(context, showSecondsColumn: false, onConfirm: (time) async {
                    var newAddTask = Task.create(name: value, createdAt: time);

                    _allTask.add(newAddTask);
                    await _localStorage.addTask(task: newAddTask);
                    setState(() {
                      
                    });
                  });
                }
              },
            ),
          ),
        );
      },
    );
  }
  
  void _getAllTaskFromDb() async{
    _allTask = await _localStorage.getAllTask();
    setState(() {
      
    });
  }
}
