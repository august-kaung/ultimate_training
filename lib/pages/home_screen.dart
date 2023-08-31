import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_training/local_storage/get_storage_helper.dart';
import 'package:ultimate_training/local_storage/hive_helper.dart';
import 'package:ultimate_training/local_storage/shared_preference_helper.dart';
import 'package:ultimate_training/statemanagement/counter_bloc.dart';

import 'package:ultimate_training/statemanagement/getx.dart';
import 'package:ultimate_training/statemanagement/provider.dart';



class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  final TextEditingController controllerOne=TextEditingController();
  final TextEditingController controllerTwo=TextEditingController();
  final TextEditingController controllerThree=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) =>
            Scaffold(
              floatingActionButton: FloatingActionButton(onPressed: (){
                HiveHelper.showPath();
              }),
              appBar: AppBar(
                title: const Text('Home Screen'),
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(onPressed: () {
                            controller.incrementNum();
                          }, icon: const Icon(Icons.plus_one)),
                          Obx(() => Text(controller.num.toString())),
                          IconButton(onPressed: () {
                            controller.decrementNum();
                          }, icon: const Icon(Icons.exposure_minus_1)),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: () {
                            provider.incrementData();
                          }, icon: const Icon(Icons.plus_one)),
                          Text(provider.dataa.toString()),
                          IconButton(onPressed: () {
                            provider.decrementData();
                          }, icon: const Icon(Icons.exposure_minus_1)),
                        ],
                      ),
                      BlocBuilder<CounterBloc, CounterState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              IconButton(onPressed: () {
                                BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                              }, icon: const Icon(Icons.plus_one)),
                              Text(state.data.toString()),
                              IconButton(onPressed: () {
                                context.read<CounterBloc>().add(DecrementEvent());
                              }, icon: const Icon(Icons.exposure_minus_1)),
                            ],
                          );
                        },
                      ),
                      TextField(
                        controller: controllerOne,
                      ),
                      ElevatedButton(onPressed: (){
                        SharePreferenceHelper.setStringData('One', controllerOne.text);
                        String ? dataOne=SharePreferenceHelper.getStringData('One');
                        debugPrint(dataOne.toString());
                      }, child: const Text('Confirm')),
                      TextField(
                        controller: controllerTwo,
                      ),
                      ElevatedButton(onPressed: (){
                        GetStorageHelper.putBox('Two', controllerTwo.text);
                        var dataTwo=GetStorageHelper.getBox('Two');
                        debugPrint(dataTwo.toString());
                      }, child: const Text('Confirm')),

                      TextField(
                        controller: controllerThree,
                      ),
                      ElevatedButton(onPressed: (){
                        HiveHelper.setStringBoxData('BoxOne', controllerThree.text);
                        var dataThree=HiveHelper.getStringBoxData('BoxOne');
                        debugPrint(dataThree);

                      }, child: const Text('Confirm')),

                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}