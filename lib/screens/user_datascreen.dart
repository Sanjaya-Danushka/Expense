import 'package:flutter/material.dart';
import 'package:projectzero/constants/colors.dart';

class UserDatascreen extends StatefulWidget {
  const UserDatascreen({super.key});

  @override
  State<UserDatascreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDatascreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //image
          Image.asset('assets/images/user.png', width: 100, fit: BoxFit.cover),
          //title
          SizedBox(height: 20),
          Center(
            child: Text(
              'Create your account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kMainColor,
              ),
            ),
          ),
          //form
          Form(
            child: Column(
              children: [
                //name
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                ),
                //email
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
                //password
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
