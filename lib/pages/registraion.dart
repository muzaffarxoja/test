import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:helloworld/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();
  final TextEditingController passWord = TextEditingController();
  final TextEditingController passWordConfirm = TextEditingController();
  bool userExists = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: userName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter user name';
                }

                if (userExists) {
                  return 'User with such name exists';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passWord,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passWordConfirm,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                if (passWord != passWordConfirm) {
                  return 'Please enter same password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );

                    context.go(authorization);
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
