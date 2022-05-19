import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_blog/model/login.dart';
import 'package:test_blog/model/variable_global.dart';
import 'package:test_blog/screen/home_screen.dart';
import 'package:test_blog/widget/cart_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String test = "test";
  loginUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await LoginRes.connectToApi(
      email: usernameController.text,
      password: passwordController.text,
    ).then((value) => test = value.result);

    if (userLogin.result == "sukses") {
      await pref.setBool('isLogin', true);
      await pref.setString('token', userLogin.accessToken);
      tokenUser = userLogin.accessToken;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      await pref.setBool('isLogin', false);
      await pref.setString('token', "");
      tokenUser = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Menu"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff9254C8),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Image.network(
              'https://i.pinimg.com/564x/9b/6d/09/9b6d093c7753356ddf79b60ee462c5a1.jpg',
              fit: BoxFit.fill,
              height: 250,
            ),
          ),
          cardInput(
            controller: usernameController,
            hint: "username",
            isSecure: false,
          ),
          cardInput(
            controller: passwordController,
            hint: "Password",
            isSecure: true,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
                // loginUser();
                // setState(() {});
              },
              child: const Text("Login"),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 25),
                primary: const Color(0xff9254C8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
