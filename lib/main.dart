import 'package:bmicalculator/second.dart';
import 'package:bmicalculator/third.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BMICalculator(),
  ));
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {

  Color myColor = Colors.transparent;
  TextEditingController weight_Controller = TextEditingController();
  TextEditingController height_Controller = TextEditingController();

  var main_reesult = TextEditingController();

  Calculate_BMI(String weight, String height){
    var myDouble_weight = double.parse(weight);
    assert(myDouble_weight is double);
    var myDouble_height = double.parse(height);
    assert(myDouble_height is double);

    var res = (myDouble_weight / (myDouble_height * myDouble_height));

    setState(() {
      main_reesult.text = res.toStringAsFixed(2);
      if(res < 18.5){
        myColor = Color(0xFF87B1D9);
      }
      else if(res >= 18.5 && res <= 24.9){
        myColor = Color(0xFF3DD365);
      }
      else if(res >= 25 && res <= 29.9){
        myColor = Color(0xFFEEE133);
      }
      else if(res >= 30 && res <= 34.9){
        myColor = Color(0xFFFD802E);
      }
      else if(res >= 35){
        myColor = Color(0xFFF95353);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF6DD5ED),
                Color(0xFF2193B0),
              ]),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
                  Text("BMI Calculator",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Color(0xFF0038FF)),),
                  // SizedBox(height: 25,),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0),
                      child: TextField(
                        controller: weight_Controller,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter Your Weight (kg)",
                        ),
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0),
                    child: TextField(
                      controller: height_Controller,
                      autofocus: false,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(fontSize: 18.0,color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter Your Height (m)",
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top:  50.0),
                      child: Center(
                        child:  SizedBox(
                          width: 180,
                          height: 50,
                          child: ElevatedButton(onPressed: () {
                            Calculate_BMI(weight_Controller.text, height_Controller.text);
                          },
                          child: Text("CALCULATE",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xFF0038FF)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                )
                            ),
                          ),
                          ),
                        ),
                      ),
                  ),
                  SizedBox(height: 80,),
                  Center(
                    child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        color: myColor,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))
                      ),
                      child: Center(
                        child: Text("BMI := " + main_reesult.text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(height: 80,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFF87B1D9),
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            Text("Underweight",style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFF3DD365),
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            Text("Normal",style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEE133),
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            Text("Overweight",style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFD802E),
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            Text("Obese",style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFF95353),
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            Text("Extreme",style: TextStyle(fontSize: 15),),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
