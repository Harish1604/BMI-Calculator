import 'package:flutter/material.dart';
import 'result_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BMICalculator(),
    ),
  );
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMale = true;
  double height = 156;
  int weight = 50;
  int age = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                buildGenderCard(Icons.male, "MALE", isMale, () {
                  setState(() => isMale = true);
                }),
                buildGenderCard(Icons.female, "FEMALE", !isMale, () {
                  setState(() => isMale = false);
                }),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Height", style: TextStyle(color: Colors.grey)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text("cm", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 100,
                    max: 220,
                    activeColor: Colors.pink,
                    onChanged: (value) {
                      setState(() => height = value);
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildValueCard("Weight", weight, () {
                  setState(() => weight--);
                }, () {
                  setState(() => weight++);
                }),
                buildValueCard("Age", age, () {
                  setState(() => age--);
                }, () {
                  setState(() => age++);
                }),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              double bmi = weight / ((height / 100) * (height / 100));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(bmi: bmi),
                ),
              );
            },
            child: Container(
              color: Colors.pink,
              width: double.infinity,
              height: 60,
              child: const Center(
                child: Text(
                  "Calculate your BMI",
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

  Expanded buildGenderCard(
      IconData icon, String label, bool active, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF1D1E33) : const Color(0xFF111328),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80, color: Colors.white),
              const SizedBox(height: 15),
              Text(label, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildValueCard(
      String label, int value, VoidCallback onMinus, VoidCallback onPlus) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey)),
            Text(value.toString(),
                style:
                const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "$label-",
                  onPressed: onMinus,
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  heroTag: "$label+",
                  onPressed: onPlus,
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
