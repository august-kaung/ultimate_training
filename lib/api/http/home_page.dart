import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ultimate_training/api/http/base_client.dart';
import 'package:ultimate_training/api/http/model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: ()async{
              var response=await BaseClientService().getUser('/users').catchError((e){});
              if(response==null)return;
              debugPrint(response.length.toString());
              var result=userFromJson(response);
              debugPrint(result.length.toString());
            }, child: const Text('GET')),
            ElevatedButton(onPressed: ()async{
              var user=User(
                name: 'Stephen',
                qualifications: [Qualification(
                  completionData: '01-01-2023',
                  degree: 'Bachelor of Engineering',
                )]
              );

              var response=await BaseClientService().postUser('/users',user).catchError((e){});
              if(response==null)return;
              debugPrint('successful');
            }, child: const Text('POST')),
            ElevatedButton(onPressed: ()async{
              var id=2358;
              var user=User(
                  name: 'Josep',
                  qualifications: [Qualification(
                    completionData: '01-01-2024',
                    degree: 'Bachelor',
                  )]
              );

              var response=await BaseClientService().putUser('/users/$id',user).catchError((e){});
              if(response==null)return;
              debugPrint('success');
            }, child: const Text('PUT')),
            ElevatedButton(onPressed: ()async{
              var id=2358;
              var response=await BaseClientService().deleteUser('/users/$id').catchError((e){});
              if(response==null)return;

              debugPrint('successfully deleted');
            }, child: const Text('DELETE')),
          ],
        ),
      ),
    );
  }
}
