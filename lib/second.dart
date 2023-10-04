import 'package:flutter/material.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmiResult = 0.0;

  void calculateBMI(){
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if(weight > 0 && height > 0){
      double bmi = weight / ((height / 100 ) * (height / 100));
      bmiResult = bmi;
      setState(() {

      });
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
                labelText: "Height (cm)",
              ),
            ),
            SizedBox(height: 16.0,),
            ElevatedButton(onPressed: calculateBMI, child: Text("Calculate BMI"),),
            SizedBox(height: 16.0,),
            Text(
                "BMI Result : ${bmiResult.toStringAsFixed(2)}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
