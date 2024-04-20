import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: Text("Credits",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
        ),
      ),
      body: const Text(
        " Developed by Daniel Adeleke: danieladeleke05@gmail.com and DanielLeke on GitHub. Thanks to Folarin Fadeyi: Legendary-Folah on GitHub.",
      ),
    );
  }
}
