import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ultimate_training/local_storage/sqflite_helper.dart';
import 'package:ultimate_training/pages/update_screen.dart';
import 'package:ultimate_training/vos/student_vo.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<StudentVO>>(
            future: SqlHelper().getAllStudent(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                var result=snapShot.data;
                return ListView.builder(
                  itemCount: result!.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      startActionPane: ActionPane(
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                                icon: Icons.edit,
                                label: 'Edit',
                                backgroundColor: Colors.amber,
                                onPressed: (context)async{
                                   var res=await Navigator.push(context, MaterialPageRoute(builder: (_)=>UpdateScreen(
                                        id: result[index].id??0,
                                        name: result[index].name??'',
                                        age: result[index].age??0,
                                        gender: result[index].gender??'',
                                        teacherId: result[index].teacherId??0)));
                                   if(res=='success'){
                                     setState(() {

                                     });
                                   }
                                })
                          ]),
                      endActionPane: ActionPane(
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                                icon: Icons.delete,
                                label: 'Delete',
                                backgroundColor: Colors.red,
                                onPressed: (context){
                                  SqlHelper().deleteStudent(result[index].id??0);
                                  setState(() {

                                  });
                                })
                          ]),
                      child: ListTile(
                        leading:CircleAvatar(child: Text(result[index].id.toString())),
                        title:Text('${result[index].name??''} (${result[index].gender??''})'),
                        subtitle:Text(result[index].gender??''),
                        trailing:Text(result[index].teacherId.toString()),
                      ),
                    );
                  },
                );
              }
              return const Text('');
            }),
      ),
    );
  }
}
