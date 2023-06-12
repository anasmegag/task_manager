import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/model/Status.dart';
import 'package:mytasks/model/TaskModel.dart';

import '../Widgets/task.dart';

// ignore: must_be_immutable
class CalenderPage extends StatelessWidget {
  CalenderPage({Key? key}) : super(key: key);
  List <TaskModel> tasks = [
    TaskModel(id: 1, title: 'title1', category: 'category1', discreption: "discreption1", begin: DateTime.now(), end: DateTime.now(), status: Status.todo),
    TaskModel(id: 2, title: 'title2', category: 'category2', discreption: "discreption2", begin: DateTime.now(), end: DateTime.now(), status: Status.todo),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:15,right: 10,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            "Today’s task",
            style: Consts.purpulsubTitle,
          ),
          const SizedBox(height: 15,),
          DatePicker(
            DateTime.utc(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 3),
            initialSelectedDate: DateTime.now(),
            height: 80,
            width: 56,
            selectionColor: Consts.mainColor,
            selectedTextColor: Consts.backgroundColor,
            onDateChange: (date) {
              // New date selected
              {}
            },
          ),
          const SizedBox(height: 15,),
          const Divider(
            height: 2,
            color: Consts.mainColor,
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                
                itemCount: tasks.length,
                itemBuilder: (_,i){
                  return Task(task: tasks[i]);
                },
              )
            ),
          ),


        ],
      ),
    );
  }
}