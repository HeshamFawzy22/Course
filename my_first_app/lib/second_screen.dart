import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_first_app/components/shared_components.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  static const String routeName = 'second';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            defaultTextField(
              controller: emailController,
              labelText: 'Email',
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icons.email,
              validator: validateEmail,
            ),
            const SizedBox(
              height: 10,
            ),
            defaultTextField(
              controller: passwordController,
              labelText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock,
              obscureText: obscureText,
              suffixIcon: obscureText ? Icons.visibility : Icons.visibility_off,
              onSuffixIconPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              validator: validatePassword,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              color: Colors.teal,
              child: defaultButton(
                  text: 'Submit',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      log('Email: ${emailController.text}');
                      log('Password: ${passwordController.text}');
                    } else {
                      log('Form is invalid');
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
