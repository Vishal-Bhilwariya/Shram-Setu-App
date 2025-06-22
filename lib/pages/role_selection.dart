// role_selection.dart
import 'package:flutter/material.dart';

class RoleSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose Role",style: TextStyle(fontWeight: FontWeight.bold))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () =>  Navigator.pushNamed(context, '/auth'),
              child: Text("WORKER",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
            ),
            Container(height: 10,),
            TextButton(
                onPressed: () =>  Navigator.pushNamed(context, '/auth'),
                child: Text("HIRER",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
            )
          ],
        ),
      ),
    );
  }
}
