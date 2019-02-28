import 'dart:async';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextField _userNameInputForm;
  TextField _psdInputForm;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _psdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("登录"),
      ),
      body: Builder(builder: (ct) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0),
            _buildUserNameInputForm(),
            SizedBox(height: 8.0),
            _buildPsdInputForm(),
            SizedBox(height: 24.0),
            _buildLoginBtn(ct),
            SizedBox(height: 10.0),
            Container(
              // child: _buildRegBtn(),
              alignment: Alignment.centerRight,
            ),
          ],
        );
      }),
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return RaisedButton(

      padding: const EdgeInsets.all(8.0),
      color: Colors.blueAccent,
      textColor: Colors.white,
      child: Text("登录", style: TextStyle(fontSize: 18),),
      elevation: 4.0,
      onPressed: () {
        print('login');
      }
    );
  }

  Widget _buildUserNameInputForm() {
    _userNameInputForm = TextField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: '用户名'
      )
    );
    return _userNameInputForm;
  }

  Widget _buildPsdInputForm() {
    _psdInputForm = TextField(
      decoration: const InputDecoration(
        icon: Icon(Icons.remove_red_eye),
        hintText: '密码'
      )
    );
    return _psdInputForm;
  }

  @override
  void dispose() {
    _userNameController?.dispose();
    _psdController?.dispose();
    super.dispose();
  }
}
