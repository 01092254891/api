import 'package:api/model/login_model.dart';
import 'package:api/view/components/constant.dart';
import 'package:api/view/screens/home/hoome_screen.dart';
import 'package:api/view_model/network/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.contains("@example.com")) {
                     print("thank you");
                     return "thank you";
                  } else {
                    print("please try again");
                    return 'please try again';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                validator: (element) {
                  if (element!.isEmpty) {
                    return 'Please, Enter Your Password';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    emailController.text = 'test@example.com';
                    passwordController.text = 'password';
                    if (formKey.currentState!.validate()) {
                      // print('Login Successfully');
                      try {
                        var response = await Dio().post(
                          '$baseURL$login',
                          data: {
                            'email': emailController.text,
                            'password': passwordController.text,
                          },
                        );
                        // print(response.data);
                        LoginModel loginModel =
                            LoginModel.fromJson(response.data);
                        print(loginModel.status);
                        print(loginModel.user?.name);
                        print(loginModel.authorisation?.token);
                        token = loginModel.authorisation!.token!;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      loginModel.user!,
                                    )));
                        // Scaffold.of(context).showSnackBar(SnackBar(content: Text(response.data)));
                      } on DioError catch (error) {
                        print(error.response?.data);
                        // Scaffold.of(context).showSnackBar(SnackBar(content: Text(error.response?.data)));
                      }
                    }
                  },
                  child: Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}
