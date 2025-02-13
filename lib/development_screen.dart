import 'package:flutter/material.dart';

class DevelopmentScreen extends StatefulWidget {
  const DevelopmentScreen({super.key});

  @override
  _DevelopmentScreenState createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  // State variables for tracking selected options
  Map<String, bool> options = {
    "motor skills": false,
    "fine motor skills": false,
    "social activities": false,
    "speech and language": false,
  };

  // Define the colors for the selected states in order
  final List<Color> selectedColors = [
    Colors.pink.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.purple.shade100,
  ];

  final List<Color> selectedTextColors = [
    Colors.pink,
    Colors.green,
    Colors.blue,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5), // Light beige background
      appBar: AppBar(
        title: const Text("Back", style: TextStyle(color: Colors.grey)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Let’s get to know Emma a bit better!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Which areas of your child’s development would you like to focus on?",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: options.keys.map((key) {
                  int index =
                      options.keys.toList().indexOf(key); // Index of the option
                  bool isSelected =
                      options[key]!; // Whether the option is selected

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        options[key] = !options[key]!; // Toggle the selection
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center, // Center the text
                      decoration: BoxDecoration(
                        color: isSelected
                            ? selectedColors[index] // Selected color
                            : Colors.white, // Deselected color
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? selectedTextColors[
                                  index] // Border matches the selected color
                              : Colors
                                  .grey.shade300, // Grey border for deselected
                        ),
                      ),
                      child: Text(
                        key,
                        style: TextStyle(
                          color: isSelected
                              ? selectedTextColors[index] // Selected text color
                              : Colors.grey.shade300, // Grey for deselected
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: options.containsValue(true)
                  ? () {
                      // Navigate to the next screen or perform an action
                      print("Next button pressed");
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: options.containsValue(true)
                    ? Colors.black // Black when active
                    : Colors.grey.shade300, // Grey when disabled
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Adjusted radius
                ),
              ),
              child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 16,
                  color: options.containsValue(true)
                      ? Colors.white // White text when active
                      : Colors.grey.shade400, // Grey text when disabled
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "We collect your data to personalize activities and track growth, ensuring a secure and enhanced experience.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
