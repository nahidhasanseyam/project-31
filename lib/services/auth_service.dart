import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

 Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
     );

// Email & password sing up
Future<String> createUserWithEmailAndPassword(String email,String password, String name) async{
  final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, password: password);

  // Update the username
 var userUpdateInfo = UserUpdateInfo();
 userUpdateInfo.displayName = name;
 await currentUser.updateProfile(userUpdateInfo);
 await currentUser.reload();
 return currentUser.uid;

}


// Email & password sing in




//sing uot



}
