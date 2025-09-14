import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({super.key});

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = "", _password = "", _userName = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Textform field kullanimi")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (deger) {
                    _userName = deger!;
                  },
                  /* initialValue: "emrealtunbilek", */
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    hintText: "Username",
                  ),
                  validator: (deger) {
                    if (deger!.length < 4) {
                      return "Username en az 4 karakter olmalıdır.";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  onSaved: (deger) {
                    _email = deger!;
                  },
                  /* initialValue: 'emrealtunbilek@gmail.com', */
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hint: Text("Email"),
                    /* errorStyle: TextStyle(color: Colors.orange), */
                  ),
                  validator: (deger) {
                    if (deger!.isEmpty) {
                      return "Email boş olamaz";
                    } else if (!EmailValidator.validate(deger!)) {
                      return "Geçersiz bir mail girdiniz";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  onSaved: (deger) {
                    _password = deger!;
                  },

                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hint: Text("Password"),
                    /* errorStyle: TextStyle(color: Colors.orange), */
                  ),
                  validator: (deger) {
                    if (deger!.length < 6) {
                      return "Şifre en az 6 karakter olmalı";
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    bool _validte = _formKey.currentState!.validate();
                    if (_validte) {
                      _formKey.currentState!.save();
                      String result =
                          "username:$_userName\nemail:$_email\n$_password";

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(result)));
                      _formKey.currentState!.reset();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Lütfen gerekli alanları doldurunuz."),
                        ),
                      );
                    }
                  },
                  child: Text("Onayla"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
