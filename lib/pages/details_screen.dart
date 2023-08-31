import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_training/dao/user_dao_impl.dart';
import 'package:ultimate_training/vos/example_class.dart';
import 'package:ultimate_training/local_storage/shared_preference_helper.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final TextEditingController controllerOne = TextEditingController();

  final TextEditingController controllerTwo = TextEditingController();

  final TextEditingController controllerThree = TextEditingController();

  final TextEditingController controllerFour = TextEditingController();

  UserVo ? user;
  UserVo ? hiveUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: controllerOne,
              ),
              TextField(
                controller: controllerTwo,
              ),
              TextField(
                controller: controllerThree,
              ),
              TextField(
                controller: controllerFour,
              ),
              ElevatedButton(
                  onPressed: () {
                    final UserVo user = UserVo(
                        name: controllerOne.text,
                        age: int.parse(controllerTwo.text),
                        address: controllerThree.text,
                        phone: int.parse(controllerFour.text));

                    UserDaoImpl().save(user);

                        ///Save Object with SharedPreference
                    // var jsonUser=jsonEncode(user);
                    // SharePreferenceHelper.setStringData('user', jsonUser);
                  },
                  child: const Text('Submit')),
              ElevatedButton(onPressed: (){
                var jsonData=SharePreferenceHelper.getStringData('user');
                if(jsonData!=null){
                  var savedData=jsonDecode(jsonData);
                   user=UserVo.fromJson(savedData);
                }else {
                  return;
                }
                setState(() {

                });
              }, child: const Text('Show Saved Data')),
              Text((user==null)?'No Data':user!.name.toString()),
              Text((user==null)?'No Data':user!.age.toString()),
              Text((user==null)?'No Data':user!.address.toString()),
              Text((user==null)?'No Data':user!.phone.toString()),
              ElevatedButton(onPressed: (){
                hiveUser=UserDaoImpl().getDataFromBox();
                debugPrint(hiveUser!.name.toString());
                setState(() {

                });
              }, child: const Text('Submit')),
              Text((hiveUser==null)?'No Data':hiveUser!.name.toString()),
              Text((hiveUser==null)?'No Data':hiveUser!.age.toString()),
              Text((hiveUser==null)?'No Data':hiveUser!.address.toString()),
              Text((hiveUser==null)?'No Data':hiveUser!.phone.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
