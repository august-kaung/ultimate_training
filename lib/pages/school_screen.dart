import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_training/local_storage/sqflite_helper.dart';
import 'package:ultimate_training/pages/dashboard.dart';
import 'package:ultimate_training/vos/student_vo.dart';

import '../vos/teacher_vo.dart';


class SchoolScreen extends StatelessWidget {
   SchoolScreen({super.key});
   final TextEditingController controller1=TextEditingController();
   final TextEditingController controller2=TextEditingController();
   final TextEditingController controller3=TextEditingController();
   final TextEditingController controller4=TextEditingController();
   final TextEditingController controller5=TextEditingController();
   final TextEditingController controller6=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const DashBoard()));
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: controller1,
            ),
            TextField(
              controller: controller2,

            ),
            TextField(
              controller: controller3,

            ),
            TextField(
              controller: controller4,

            ),
            ElevatedButton(onPressed: ()async{
              StudentVO student=StudentVO(
                name: controller1.text,
                age: int.parse(controller2.text),
                gender: controller3.text,
                teacherId: int.parse(controller4.text),
              );
              await SqlHelper().addStudent(student);
              //await SqlHelper().deleteStudent(2);
              //await SqlHelper().updateStudent(student,2);
              controller1.clear();
              controller2.clear();
              controller3.clear();
              controller4.clear();
            }, child: const Text('confirm')),
            TextField(
              controller: controller5,
            ),
            ElevatedButton(onPressed: ()async{
              TeacherVO teacher=TeacherVO(
                name: controller5.text
              );
              await SqlHelper().addTeacher(teacher);
              //await SqlHelper().deleteTeacher(2);
              //await SqlHelper().updateTeacher(teacher,2);
              controller5.clear();
            }, child: const Text('confirm')),
          ],
        ),
      ),
    );
  }
}
