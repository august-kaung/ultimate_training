import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ultimate_training/local_storage/sqflite_helper.dart';
import 'package:ultimate_training/vos/student_vo.dart';

class UpdateScreen extends StatefulWidget {
  int ? id;
  String ? name;
  int ? age;
  String ? gender;
  int ? teacherId;

  UpdateScreen({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.teacherId});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String ? name, gender;
  int ? id, age, teacherId;
  GlobalKey<FormState>key = GlobalKey<FormState>();


  @override
  void initState() {

    name = widget.name;
    gender = widget.gender;
    id = widget.id;
    age = widget.age;
    teacherId = widget.teacherId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(widget.name);
        },
      ),
      body: SafeArea(
          child: Form(
            key: key,
            child: Column(children: [
              TextFormField(
                onSaved: (text){
                  name=text;
                },
                initialValue: name,
              ),
              TextFormField(
                onSaved: (text){
                  age=int.parse(text??'');
                },
                initialValue: age.toString(),
              ),
              TextFormField(
                onSaved: (text){
                  gender=text;
                },
                 initialValue: gender,
              ),
              TextFormField(
                onSaved: (text){
                  teacherId=int.parse(text??'');
                },
                  initialValue: teacherId.toString(),
              ),
              ElevatedButton(
                  onPressed: () async {
                    key.currentState!.save();
                    StudentVO vo = StudentVO(
                      name: name,
                      age: age,
                      gender: gender,
                      teacherId: teacherId,
                      id: id
                    );
                    await SqlHelper().updateStudent(vo, id ?? 0);
                    if (!mounted) return;
                    Navigator.pop(context, 'success');
                  },
                  child: const Text('Update'))
            ]),
          )),
    );
  }
}
