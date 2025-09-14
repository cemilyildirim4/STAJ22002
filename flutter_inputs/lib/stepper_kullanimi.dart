import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class StepperOrnek extends StatefulWidget {
  const StepperOrnek({super.key});

  @override
  State<StepperOrnek> createState() => _StepperOrnekState();
}

class _StepperOrnekState extends State<StepperOrnek> {
  int _aktifStep = 0;
  late String isim, mail, sifre;
  late List<Step> tumStepler;

  bool hata = false;

  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();
    return Scaffold(
      appBar: AppBar(title: Text("Stepper Örnek")),
      body: SingleChildScrollView(
        child: Stepper(
          type: StepperType.vertical,
          steps: tumStepler,
          currentStep: _aktifStep,
          /* onStepTapped: (tiklanilanStep) {
            setState(() {
              _aktifStep = tiklanilanStep;
            });
          }, */
          onStepContinue: () {
            setState(() {
              _ileriButonuKontrolu();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifStep > 0) {
                _aktifStep--;
              } else {
                _aktifStep = 0;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("Username Başlık"),
        subtitle: Text("Username Altbaşlık"),
        state: _stateleriAyarla(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
            labelText: "Username Label",
            hintText: "UsernameHint",
            border: OutlineInputBorder(),
          ),
          validator: (deger) =>
              (deger!.length < 6) ? "En az 6 karakter giriniz" : null,
          onSaved: (deger) => isim = deger!,
        ),
      ),

      Step(
        title: Text("Mail Başlık"),
        subtitle: Text("Mail Altbaşlık"),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          keyboardType: TextInputType.emailAddress,
          key: key1,
          decoration: InputDecoration(
            labelText: "Mail Label",
            hintText: "Mail Hint",
            border: OutlineInputBorder(),
          ),
          validator: (deger) =>
              (!EmailValidator.validate(deger!)) ? "Geçersiz email." : null,
          onSaved: (deger) => mail = deger!,
        ),
      ),

      Step(
        title: Text("Password Başlık"),
        subtitle: Text("Password Altbaşlık"),
        state: _stateleriAyarla(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
            labelText: "Password Label",
            hintText: "PasswordHint",
            border: OutlineInputBorder(),
          ),
          validator: (deger) =>
              (deger!.length < 6) ? "En az 6 karakter giriniz" : null,
          onSaved: (deger) => sifre = deger!,
        ),
      ),
    ];
    return stepler;
  }

  StepState _stateleriAyarla(int oankiStep) {
    if (_aktifStep == oankiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void _ileriButonuKontrolu() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;
      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _aktifStep = 2;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          _aktifStep = 2;
          formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void formTamamlandi() {
    debugPrint("Girilen değerler isim => $isim email=> $mail şifre=> $sifre");
  }
}
