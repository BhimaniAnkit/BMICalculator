import 'package:flutter/material.dart';

class third extends StatefulWidget {
  const third({Key? key}) : super(key: key);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmiResult = 0.0;
  String weightStage = "";

  void calculateBMI(){
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if(weight > 0 && height > 0){
      double bmi = weight / ((height / 100) * (height / 100));
      String stage = getWeightStage(bmi);
      bmiResult = bmi;
      weightStage = stage;
      setState(() {

      });
    }
  }

  String getWeightStage(double bmi){
    if(bmi < 18.5){
      return "Underweight";
    }
    else if(bmi >= 18.5 && bmi < 24.9){
      return "Normal";
    }
    else if(bmi >= 25.0 && bmi < 29.9){
      return "Overweight";
    }
    else{
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Weight (kg)",
              ),
            ),
            SizedBox(height: 16.0,),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 16.0),
            Text(
              'BMI Result: ${bmiResult.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Weight Stage: $weightStage',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
