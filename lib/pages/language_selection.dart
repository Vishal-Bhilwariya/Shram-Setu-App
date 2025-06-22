// language_selection.dart
import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Language",style: TextStyle(fontWeight: FontWeight.bold),)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/role'),
                  child: Text("English",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
            ),
            Card(
              child: TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/role'),
                  child: Text("Hindi",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
            ),
          ],
        ),
      ),
    );
  }
}
