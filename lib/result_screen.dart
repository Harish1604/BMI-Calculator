import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;
  const ResultScreen({required this.bmi, Key? key}) : super(key: key);

  String getResultText() {
    if (bmi >= 25) return "Overweight";
    else if (bmi > 18.5) return "Normal";
    else return "Underweight";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Your Result",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    getResultText().toUpperCase(),
                    style: TextStyle(
                        color: getResultText() == "Normal"
                            ? Colors.green
                            : Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 80, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Normal BMI range:\n18.5 - 25 kg/m²",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    getResultText() == "Normal"
                        ? "You have a normal body weight. Good job!"
                        : "Please take care of your health.",
                    textAlign: TextAlign.center,maxLines: 2,
                    style: const TextStyle(fontSize: 16,),

                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.pink,
              width: double.infinity,
              height: 60,
              child: const Center(
                child: Text(
                  "RE-CALCULATE YOUR BMI",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
