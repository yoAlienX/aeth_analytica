import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FormValidation(),
    debugShowCheckedModeBanner: false,
  ));
}

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                spacing: 15,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text('Name'), hintText: 'full name'),
                    validator: (name) =>
                        name!.isEmpty ? 'Please enter your full name' : null,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        InputDecoration(label: Text('Email'), hintText: 'email'),
                    validator: (email) =>
                        email!.contains('@') ? null : 'Enter your email',
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text('Password'), hintText: 'password'),
                    validator: (pass) => pass!.length < 6
                        ? 'Password should have minimum 6 characters'
                        : null,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Validated and pressed submit button')));
                        }
                      },
                      child: Text('Submit')),
                ],
              ),
            )),
      ),
    );
  }
}
