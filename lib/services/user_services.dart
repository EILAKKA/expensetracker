import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  // method to storage the user name and user email in shared pref
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      // check weather the user entered password and the confirm password are the same

      if (password != confirmPassword) {
        // show a message to the user

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwor and confirmPassword do not match')),
        );
      }

      // if the users password and confirmPassword are same then stroe the users name and email
      // create an instance from shared preferenses
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // store the user name and email as key value pairs
      await prefs.setString("username", userName);
      await prefs.setString("email", email);

      // show a messsage to the user
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User details stored successfully')),
        );
      }
    } catch (e) {
      e.toString();
    }
  }

  // method to check weather the username is saved in the shared pref
  static Future<bool> checkUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString("username");
    return userName != null;
  }
}
