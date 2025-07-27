import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/utils.dart';

class myStepper extends StatefulWidget {
  const myStepper({
    Key? key,
    required this.title_stepper,
    required this.img_stepper,
  }) : super(key: key);
  final List<String> title_stepper;
  final List<String> img_stepper;

  @override
  State<myStepper> createState() => _myStepperState();
}

class _myStepperState extends State<myStepper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (
        BuildContext context, {
        VoidCallback? onStepContinue,
        VoidCallback? onStepCancel,
      }) {
        return Row(
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: secondColor,
              ),
              onPressed: onStepContinue,
              child: const Text('ถัดไป'),
            ),
            SizedBox(width: 10),
            TextButton(
              style: TextButton.styleFrom(
                primary: secondColor,
              ),
              onPressed: onStepCancel,
              child: const Text('ก่อนหน้า'),
            ),
          ],
        );
      },
      currentStep: currentStep,
      onStepCancel: () {
        if (currentStep > 0) {
          setState(() {
            currentStep > 0 ? currentStep -= 1 : currentStep = 0;
          });
        }
      },
      onStepContinue: () {
        if (currentStep < widget.title_stepper.length - 1) {
          setState(() {
            currentStep += 1;
          });
        } else {
          currentStep = widget.title_stepper.length - 1;
        }
      },
      onStepTapped: (step) {
        setState(() {
          currentStep = step;
          print(step);
        });
      },
      steps: widget.title_stepper
          .asMap()
          .entries
          .map(
            (entry) => Step(
              title: Text(entry.value),
              content: Container(
                alignment: Alignment.centerLeft,
                child: widget.img_stepper[entry.key] == ""
                    ? null
                    : Image.asset(
                        widget.img_stepper[entry.key],
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
              ),
              isActive: true,
            ),
          )
          .toList(),
    );
  }
}
