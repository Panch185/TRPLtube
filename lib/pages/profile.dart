import 'package:flutter/material.dart';
import 'package:trpl_tube/buttom_profile.dart';
import 'package:trpl_tube/text_field.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});

   final usernameController = TextEditingController();
   final passwordController = TextEditingController();

   void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 152, 107, 192),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body:  SafeArea(
        child: Center(
            child: Column(
              children:  [
                 SizedBox( height: 50,),
            Text('Стань ночной мышью', style: TextStyle(fontSize: 28, color: Colors.white),),
              SizedBox(height: 50,),
             MyTextField(
               controller: usernameController,
               hintText: 'Логин',
               obscureText: false,
             ),
              SizedBox(height: 20,),
              MyTextField(
                controller: passwordController,
                hintText: 'Пароль',
                obscureText: true,
              ),
              SizedBox(height: 30,),
              MyButtom(
                onTap: signUserIn,
              ),
              ],
            ),
        ),
      ),
    );
  }
}