import 'package:firebase_auth/firebase_auth.dart';
import 'package:snipp/services/database.dart';



class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Anonymous sign in

  Future signInAnon() async {

    try {

      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;

    } catch(e) {

      print(e.toString());
      return null;

    }

  }

  // Authentication stream

  Stream<User> get user {

    return _auth.authStateChanges();
  }


  // Login with email and password

  Future loginWithEmailAndPassword(String email, String password) async {

    try {

      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;

    } catch(e) {

      print(e.toString());
      return null;
    }

  }


  // Register with email and password

  Future registerUserWithEmailAndPassword(String email, String password, String name) async {

    try {

      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      User user = result.user;

      await UserDatabaseService(uid: user.uid).updateUserData(name, "bio", 0 , 0);

      return user;


    } catch(e) {

      print(e.toString());
      return null;

    }

  }

  Future registerTalentWithEmailAndPassword(String email, String password, String name) async {

    try {

      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      User user = result.user;

      await TalentDatabaseService(uid: user.uid).updateTalentData(name, "bio", 0 , 0);

      return user;


    } catch(e) {

      print(e.toString());
      return null;

    }

  }

  // Sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
    }
  }


}