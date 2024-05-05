import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/base_client.dart';
import 'package:twitter_clone/screens/signup_screen.dart';
import 'package:twitter_clone/services/auth_service.dart';
import 'package:twitter_clone/utils/colors.dart';
import 'package:twitter_clone/widgets/custom_snackbar.dart';
import 'package:twitter_clone/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void handleLogin() async {
    String? token = await AuthService.getToken();
    print("token: $token");
    // String email = _emailController.text;
    // String password = _passwordController.text;

    // if (email != '' && password != '') {
    //   AuthService.login(email, password);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: const Text(
                            "Đăng nhập",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1200),
                          child: Text(
                            "Đăng nhập với tài khoảng của bạn",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                          duration: const Duration(milliseconds: 1200),
                          child: InputField(
                            label: "Email",
                            controller: _emailController,
                          ),
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1300),
                          child: InputField(
                            label: "Mật khẩu",
                            obscureText: true,
                            controller: _passwordController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1400),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: const EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: const Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                              )),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () {
                              handleLogin();
                            },
                            color: AppColor.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              "Đăng nhập",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      )),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Chưa có tài khoảng?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              " Đăng ký",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login-background.png'),
                      fit: BoxFit.cover),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
