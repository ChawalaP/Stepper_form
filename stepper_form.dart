import 'package:flutter/material.dart';
import 'package:stepper_form/model/data.dart';

class Stepper_Form extends StatefulWidget {
  const Stepper_Form({Key? key, }) : super(key: key);

  @override
  State<Stepper_Form> createState() => _Stepper_FormState();
}

class _Stepper_FormState extends State<Stepper_Form> {
  GlobalKey<FormState> _formKey =  GlobalKey<FormState>();
  int activeStepIndex = 0;
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController blood_type = TextEditingController();
  TextEditingController houseNo = TextEditingController();
  TextEditingController subDistrict= TextEditingController();
  TextEditingController district= TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController postal_code = TextEditingController();


  @override
  void dispose() {
    name.dispose();
    age.dispose();
    weight.dispose();
    blood_type.dispose();
    houseNo.dispose();
    subDistrict.dispose();
    district.dispose();
    province.dispose();
    postal_code.dispose();
    super.dispose();
  }

  List<Step> stepList() => [
    Step(
      state: activeStepIndex <= 0 ? StepState.editing : StepState.complete,
      isActive: activeStepIndex >= 0,
      title: const Text('ข้อมูลส่วนตัว'),
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ชื่อนามสกุล',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: age,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'อายุ',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: weight,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'น้ำหนัก',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: height,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ส่วนสูง',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: blood_type,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'กรุ๊ปเลือด',
              ),
            ),
          ],
        ),
      ),
    ),
    Step(
        state:
        activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: activeStepIndex >= 1,
        title: const Text('ที่อยู่'),
        content: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: houseNo,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'บ้านเลขที่',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: subDistrict,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ตำบล',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: district,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'อำเภอ',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: province,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'จังหวัด',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: postal_code,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'รหัสไปรษณีย์',
              ),
            ),
          ],
        ),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper form'),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if (activeStepIndex < stepList().length - 1) {
            setState(() {
              activeStepIndex += 1;
            });
          } else {
            setState(() {
              Data(name.text, int.parse(age.text), int.parse(weight.text), int.parse(height.text),
                  blood_type.text, houseNo.text, subDistrict.text, district.text,
                  province.text, postal_code.text);
            });
            //print('${name.text}');
          }
        },
        onStepCancel: () {
          if (activeStepIndex == 0) {
            return;
          }
          setState(() {
            activeStepIndex -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            activeStepIndex = index;
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          final isLastStep = activeStepIndex == stepList().length - 1;
          return Row(
            children: <Widget>[
              TextButton(
                onPressed: details.onStepContinue,
                child: (isLastStep)
                    ? const Text('ตกลง')
                    : const Text('ต่อไป'),
              ),
              const SizedBox(
                width: 10,
              ),
              if (activeStepIndex > 0)
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text('ย้อนกลับ'),
                ),
            ],
          );
        },
      ),
    );
  }
}