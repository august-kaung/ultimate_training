import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_training/api/http/home_page.dart';
import 'package:ultimate_training/pages/details_screen.dart';
import 'package:ultimate_training/vos/example_class.dart';
import 'package:ultimate_training/local_storage/shared_preference_helper.dart';
import 'package:ultimate_training/pages/school_screen.dart';
import 'package:ultimate_training/statemanagement/counter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('MyStringBox');
  await Hive.openBox<int>('MyIntBox');

  Hive.registerAdapter(UserVoAdapter());
  await Hive.openBox<UserVo>('userbox');
  await GetStorage.init();
  await SharePreferenceHelper.getSPHelperInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

