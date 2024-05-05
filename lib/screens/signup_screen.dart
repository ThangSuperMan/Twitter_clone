import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/base_client.dart';
import 'package:twitter_clone/screens/login_screen.dart';
import 'package:twitter_clone/screens/posts_screen.dart';
import 'package:twitter_clone/utils/colors.dart';
import 'package:twitter_clone/widgets/custom_snackbar.dart';
import 'package:twitter_clone/widgets/input_field.dart';
import 'package:twitter_clone/widgets/input_field_datetime.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  late String dateOfBirth;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void handleSignUp() async {
    String email = _emailController.text;
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      print("password and confirmPassword does not match");
    }

    try {
      Map<String, dynamic> object = {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "date_of_birth": dateOfBirth,
        "password": password,
      };
      print("object: $object");

      var response = await BaseClient().post("/api/v1/register", object);
      print("response: $response");
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar(
          message: 'Đăng ký tài khoản thành công!',
          color: Colors.green,
        ),
      );
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        actions: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostsScreen(),
                      ),
                    )
                  },
                  child: const Text(
                    'Trải nghiệm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 240,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      "Đăng ký",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Column(
                children: <Widget>[
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: InputField(
                        label: "Email *", controller: _emailController),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1100),
                    child: InputField(
                        label: "Họ *", controller: _lastNameController),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1100),
                    child: InputField(
                        label: "Tên *", controller: _firstNameController),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1200),
                    child: InputFieldDateTime(
                        label: "Năm sinh *",
                        onChanged: (day, month, year) {
                          if (day != '' && month != '' && year != '') {
                            dateOfBirth =
                                '$year-${month.padLeft(2, '0')}-${day.padLeft(2, '0')}';
                            print("dateOfBirth : $dateOfBirth ");
                          }
                        }),
                  ),
                  FadeInUp(
                    duration: const Duration(
                      milliseconds: 1300,
                    ),
                    child: InputField(
                        label: "Mật khẩu *",
                        obscureText: true,
                        controller: _passwordController),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1400),
                    child: InputField(
                        label: "Xác nhận mật khẩu *",
                        obscureText: true,
                        controller: _confirmPasswordController),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: const Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      handleSignUp();
                    },
                    color: AppColor.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      "Đăng ký",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FadeInUp(
                duration: const Duration(milliseconds: 1600),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Đã có một tài khoảng?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        " Đăng nhập",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});
// }
