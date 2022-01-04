import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final name1 = GlobalKey<FormFieldState>();
  final name2 = GlobalKey<FormFieldState>();
  final name3 = GlobalKey<FormFieldState>();
  final name4 = GlobalKey<FormFieldState>();
  final name5 = GlobalKey<FormFieldState>();
  int step = 0;

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
        isActive: true,
        title: const Text("Name1"),
        content: TextFormField(
          key: name1,
          validator: (v) => v!.isEmpty ? "Bo'sh kiritish mumkin emas !" : null,
        ),
      ),
      Step(
        isActive: true,
        title: const Text("Name2"),
        content: TextFormField(
          validator: (v) => v!.isEmpty ? "Bo'sh kiritish mumkin emas !" : null,
          key: name2,
        ),
      ),
      Step(
        isActive: true,
        title: const Text("Name3"),
        content: TextFormField(
          validator: (v) => v!.isEmpty ? "Bo'sh kiritish mumkin emas !" : null,
          key: name3,
        ),
      ),
      Step(
        isActive: true,
        title: const Text("Name4"),
        content: TextFormField(
          validator: (v) => v!.isEmpty ? "Bo'sh kiritish mumkin emas !" : null,
          key: name4,
        ),
      ),
      Step(
        isActive: true,
        title: const Text("Name5"),
        content: TextFormField(
          validator: (v) => v!.isEmpty ? "Bo'sh kiritish mumkin emas !" : null,
          key: name5,
        ),
      ),
    ];
    Size size = MediaQuery.of(context).size;
    List keys = [name1, name2, name3, name4, name5];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Data time"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stepper(
              steps: steps,
              currentStep: step,
              onStepTapped: (i) {
                setState(
                  () {
                    keys[step].currentState!.validate() ? step = i : null;
                  },
                );
              },
              onStepCancel: () {
                setState(
                  () {
                    step != 0 ? step-- : null;
                  },
                );
              },
              onStepContinue: () {
                setState(
                  () {
                    keys[step].currentState!.validate()
                        ? setState(
                            () {
                              step != steps.length - 1 ? step++ : null;
                            },
                          )
                        : null;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
