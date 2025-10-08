import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  // 🟡 පරිශීලක විස්තර SharedPreferences එකට සුරැකිම
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      // 🔍 මුරපදය සහ තහවුරු මුරපදය සමානද කියා පරීක්ෂා කිරීම
      if (password != confirmPassword) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('මුරපදය සහ තහවුරු මුරපදය නොගැලපේ')),
          );
        }
        return; // සමාන නැත්නම් ක්‍රියාව නවත්වන්න
      }

      // 💾 SharedPreferences instance එක ලබාගන්න
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // 📝 පරිශීලක නම සහ ඊමේල් සුරැකීම
      await prefs.setString("username", userName);
      await prefs.setString("email", email);

      // ✅ සාර්ථකව සුරැකූ බව පරිශීලකයාට දැනුම්දීම
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('පරිශීලක විස්තර සුරැකියි')),
        );
      }
    } catch (e) {
      debugPrint("විස්තර සුරැකීමේ දෝෂයක්: ${e.toString()}");
    }
  }

  // 🔍 username එක SharedPreferences තුළ තිබේද කියා පරීක්ෂා කිරීම
  static Future<bool> checkUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("username") != null;
  }

  // 📤 SharedPreferences එකෙන් username සහ email ලබාගැනීම
  static Future<Map<String, String>?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString("username");
    String? email = prefs.getString("email");

    if (userName != null && email != null) {
      return {"username": userName, "email": email};
    } else {
      return null; // දත්ත නොමැති නම් null return කරන්න
    }
  }
}
