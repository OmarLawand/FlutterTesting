import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginInput();
  }
}

class LoginInput extends StatefulWidget {
  const LoginInput({Key? key}) : super(key: key);

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {

  void handleLogin(){

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        const Text("Fucking Email"),
        TextField(
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text("Fucking password"),
        TextField(
            style: TextStyle(),
            obscureText: true,
            decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ))
        ),
        ElevatedButton(onPressed: () {}, child: const Text("Login"),)
      ],
    );
  }
}
