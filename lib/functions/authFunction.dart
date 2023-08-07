import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signUpFunction(String emailAddress,String password)async{
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return true;
    print('///////// Signed up success  ////////');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {

    print(e);
    return false;
  }
}

Future<bool> signInFunction(String email, String password) async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    print('///////// logged in success  ////////');
    return true;
  }
  on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      return false;
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      return false;
    }
    return false;
  }

}

