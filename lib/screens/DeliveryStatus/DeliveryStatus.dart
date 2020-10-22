import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/screens/DeliveryStatus/DeliveryStatusProvider.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';

class DeliveryStatusScreen extends StatefulWidget {
  @override
  _DeliveryStatusScreenState createState() => _DeliveryStatusScreenState();
}

class _DeliveryStatusScreenState extends State<DeliveryStatusScreen> {
  DeliveryStatusProvider deliveryStatusProvider;
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<DeliveryStatusProvider>(
      create: (_) => DeliveryStatusProvider()..setView(context),
      child: Consumer<DeliveryStatusProvider>(builder: (context, model, child) {
        deliveryStatusProvider = model;
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Icon(
                Icons.arrow_back,
                color: textColor,
              ),
              title: Text(
                'Delivery status',
                style: TextStyle(color: textColor, fontSize: 18),
              )),
          backgroundColor: bgColor,
          body: Stepper(
            type: StepperType.horizontal,
            currentStep: _currentStep,
            onStepTapped: (int step) => setState(() => _currentStep = step),
            onStepContinue: _currentStep < 2 ? () => setState(() => _currentStep += 1) : null,
            onStepCancel: _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
            steps: <Step>[
              new Step(
                title: new Text('Shipping'),
                content: new Text('This is the first step.'),
                isActive: _currentStep >= 0,
                state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              new Step(
                title: new Text('Payment'),
                content: new Text('This is the second step.'),
                isActive: _currentStep >= 0,
                state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              new Step(
                title: new Text('Order'),
                content: new Text('This is the third step.'),
                isActive: _currentStep >= 0,
                state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
              new Step(
                title: new Text('Order'),
                content: new Text('This is the third step.'),
                isActive: _currentStep >= 0,
                state: _currentStep >= 3 ? StepState.complete : StepState.disabled,
              ),
            ],
          ),
        );
      }),
    );
  }
}
