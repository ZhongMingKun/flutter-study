import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LoginPage extends StatelessWidget {
  Widget _buildLoginForm() {
    return TextField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'What do people call you?',
        labelText: 'Name *',
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return new Scaffold(
      body: Center(
        child: _buildLoginForm()
      ),
    );
  }
}
