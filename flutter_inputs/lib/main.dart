import 'package:flutter/material.dart';
import 'package:flutter_inputs/global_key_kullanimi.dart';
import 'package:flutter_inputs/stepper_kullanimi.dart';
import 'package:flutter_inputs/text_form_field_kullanimi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: false,
      ),
      home: StepperOrnek(),
    );
  }
}

class TextFielIslemleri extends StatefulWidget {
  final String title;
  const TextFielIslemleri({super.key, required this.title});

  @override
  State<TextFielIslemleri> createState() => _TextFielIslemleriState();
}

class _TextFielIslemleriState extends State<TextFielIslemleri> {
  late TextEditingController _emailController;
  late FocusNode _focusNode;
  int maxLineCount = 1;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "emre@emre.com");
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          maxLineCount = 3;
        } else {
          maxLineCount = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              focusNode: _focusNode,
              controller: _emailController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLines: maxLineCount,
              maxLength: 20,
              onChanged: (String deger) {
                setState(() {
                  if (deger.length > 3) {
                    _emailController.value = TextEditingValue(
                      text: deger,
                      selection: TextSelection.collapsed(offset: deger.length),
                    );
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Label text',
                hintText: 'Email giriniz',
                /* icon: Icon(Icons.add), */
                prefixIcon: Icon(Icons.email, color: Colors.blue),
                suffixIcon: Icon(
                  Icons.access_alarm_outlined,
                  color: Colors.blue,
                ),
                filled: true,

                /* fillColor: Colors.orange, */
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
              ),
              onSubmitted: (String deger) {
                print("Submit deger ${deger}");
              },
            ),
          ),
          Text(_emailController.text),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _emailController.text = 'emrealtunbilek.com';
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
