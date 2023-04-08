import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

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
                  DatePicker.showTimePicker(context, showSecondsColumn: false, onConfirm: (time){
                    
                  });
                }
              },
            ),
          ),
        );
      },
    );
  }
}
