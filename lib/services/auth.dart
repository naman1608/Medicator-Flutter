import 'package:firebase_auth/firebase_auth.dart';

Future signInUserWithEmailandPassword(String email, String password) async {
  try {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future registerUserWithEmailandPassword(String email, String password) async {
  try {
    return (FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password));
  } catch (e) {
    print(e.toString());
  }
}

Future signInCompanyWithEmailandPassword(String email, String password) async {
  try {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future registerCompanyWithEmailandPassword(
    String email, String password) async {
  try {
    return (FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password))
        .then((result) {
      User firebaseUser = result.user!;
    });
  } catch (e) {
    print(e.toString());
  }
}
