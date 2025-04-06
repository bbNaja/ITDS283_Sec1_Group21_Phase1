import 'package:flutter/material.dart';
import 'package:sec1_gr21/route/route_constant.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false, // for remove the back icon

        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, welcomepageRoute);
              // Navigator.pushNamed(context, '/');
            },
          )
        ],
      ),
      body: Center(
        child:
            Text("Welcome to the Home Page!", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
