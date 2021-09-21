import 'package:flutter/material.dart';
import 'package:huawei_account/huawei_account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'Huawei Account Kit'
          ),
        ),
        body: Center(
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)
            ),
            child: Text('Press Me',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: (){
              account();
            },
          ),
        ),
      ),
    );
  }
}


void account() async {
  AccountAuthParamsHelper helper = new AccountAuthParamsHelper();

  helper.setIdToken();

  try {
    // The sign-in is successful, and the user's ID information and authorization code are obtained.
    AuthAccount account = await AccountAuthService.signIn(helper);
    print("Id token: " + account.idToken!);
  } on Exception catch (e) {
    print('try again');
    print(e.toString());
  }
}