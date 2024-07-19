import 'package:api/model/login_model.dart';
import 'package:api/model/tasks.dart' as task;
import 'package:api/view/components/constant.dart';
import 'package:api/view_model/network/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  User user;

  HomeScreen(this.user, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getTasks();
    super.initState();
  }

  task.TasksModel? tasksModel;

  Future<Response?> getTasks() async {
    try {
      Dio dio = Dio(BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ));
      dio.options.headers = {
        'Authorization': 'bearer $token',
      };
      Response response = await dio.get(tasks);
      print(response.data);
      tasksModel = task.TasksModel.fromJson(response.data);
      setState(() {});
      return response;
    } on DioError catch (error) {
      print(error.response?.data);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(tasksModel?.response?.tasks?[index].title ?? ''),
                          Text(tasksModel?.response?.tasks?[index].start_date ??
                              ''),
                          Text(tasksModel?.response?.tasks?[index].end_date ??
                              ''),
                        ],
                      ),
                    ),
                    Text(tasksModel?.response?.tasks?[index].status ?? ''),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: tasksModel?.response?.tasks?.length ?? 0,
          ),
        ),
      ),
    );
  }
}
